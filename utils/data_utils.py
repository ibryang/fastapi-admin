from fastapi.encoders import jsonable_encoder


# TODO 递归获取树形结构数据
def get_tree_data(paren_list, child_list, str_id):
    for paren in paren_list:
        for child in child_list:
            if paren[f'{str_id}'] == child['parent_id']:
                if 'children' in paren and child not in paren['children']:
                    paren['children'].append(child)
                else:
                    paren['children'] = [child]
                get_tree_data(paren['children'], child_list, str_id)
    return paren_list


def get_tree_data_list(result_list, str_id='id') -> list:
    paren_list = []
    child_list = []
    if result_list:
        for result in result_list:
            # 第一层
            if not result['parent_id']:
                paren_list.append(result)
            else:
                child_list.append(result)
        # 递归获取子的层
        return get_tree_data(paren_list, child_list, str_id)
    return []


# TODO orm方式： 将一条查询的结果转化为对应字段的字典结果
def orm_one_to_dict(result):
    if not result or isinstance(result, list):
        return {}
    try:
        return jsonable_encoder(dict(zip(result.keys(), result)))
    except AttributeError:
        res_dict = result.__dict__
        if res_dict.get('_sa_instance_state'):
            del res_dict['_sa_instance_state']
        return jsonable_encoder(res_dict)


# TODO orm方式： 将多条查询结果列表转化为对应字段的字典列表
def orm_all_to_dict(result_list):
    if not isinstance(result_list, list):
        return []
    try:
        return jsonable_encoder([dict(zip(v.keys(), v)) for v in result_list])
    except AttributeError:
        res = []
        for result in result_list:
            res_dict = result.__dict__
            if res_dict.get('_sa_instance_state'):
                del res_dict['_sa_instance_state']
            res.append(result.__dict__)
        return jsonable_encoder(res)


# TODO 原生SQL方式： 将一条查询结果转化为对应字段的字典
def sql_one_to_dict(result):
    if not result or isinstance(result, list):
        return {}
    return jsonable_encoder(dict(zip(result.keys(), result)))


# TODO 原生SQL方式： 将多条查询结果列表转化为对应的字段的字典列表
def sql_all_to_dict(result_list):
    if not isinstance(result_list, list):
        return []
    return jsonable_encoder([dict(zip(v.keys(), v)) for v in result_list])
