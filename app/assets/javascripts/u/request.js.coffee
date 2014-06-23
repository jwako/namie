$('.request.index, .request.complete').ready ->
  generate_supporter_list = (json) ->
    $('.supporterList:first').empty()
    $.each(json, (i, data) ->
      supporter = _.template($("#supporterTemplate").text(), {
        id: data.id,
        name: data.name,
        description: data.description,
        profile_image: data.profile_image,
        services: data.services,
        commissions: data.commissions
      });
      $('.supporterList:first').append(supporter)
    )

  $('table').on 'click', '.table_work_supporter', ->
    $('.table_work_supporter').find('input').removeAttr('checked');
    $(this).find('input').prop('checked', true)

  $('#area_name').change ->
    $.getJSON('/api/supporter_list', { "area_id": $(this).val() }, generate_supporter_list)
  .trigger('change')
