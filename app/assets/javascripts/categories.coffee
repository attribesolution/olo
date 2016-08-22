$ ->
  updateOutput = (e) ->
    list = if e.length then e else $(e.target)
    output = list.data('output')
    if window.JSON
      array = []
      i = 0
      while i < list.nestable('serialize').length
        id = list.nestable('serialize')[i].id
        array.push(id)
        i++
      output.val array
      $.post "/categories/category_sorting", { sorted_ids: array }, (data) ->
        console.log(data.message)
    else
      output.val 'JSON browser support required for this demo.'
    return
  # activate Nestable for list 2
  $('#nestable2').nestable(group: 1).nestable('collapseAll').on 'change', updateOutput
  # output initial serialised data
  updateOutput $('#nestable2').data('output', $('#nestable2-output'))
  return