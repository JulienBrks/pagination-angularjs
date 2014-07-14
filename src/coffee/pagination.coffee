pagination = angularjs.module("pagination", [])
pagination.directive "pagination" () ->
  () ->
    link = ($scope, element) ->
      # 初始化分页
      $scope.pagination = {}
      $scope.pagination.page_size = 5
      $scope.pagination.current_page = 1
      $scope.pagination.total_page = 0
      $scope.pagination.pages = []
      $scope.pagination.is_hide_page = (index, current_index, total) ->
        hide = true

        total_index = total - 1
        # 从当前激活的页数的左边考虑
        if current_index > 2 
          if Math.abs(index - current_index) <= 2
            hide = false
        else
          if index < 6
            hide = false
        # 从当前激活的页数的右边考虑
        if total_index - current_index > 2
          if current_index - 2 <= index <= current_index + 2
            hide = false
        else
          if current_index - 2 - (2 - (total_index - current_index)) <= index <= total_index 
            hide = false    
        # 第一页一定显示
        if index == 0
          hide = false
        return hide
      $scope.pagination.is_hide_left_ellipsis = (current_index, total) ->
        hide = true
        total_index = total - 1
        if current_index - 3 > 0
          hide = false
        return hide
      $scope.pagination.is_hide_right_ellipsis = (current_index, total) ->
        hide = true
        total_index = total - 1
        if total_index - current_index > 2
          hide = false
        return hide