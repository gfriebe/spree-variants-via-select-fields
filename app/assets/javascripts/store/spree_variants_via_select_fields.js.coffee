enableDisableOptions = (select, option) ->
  position = undefined
  $('.option_values').each (index) ->
    if select.attr('name') == $(this).attr('name')
      position = index + 1


  $('.option_values').each (index) ->
    current_select = $(this)
    if select.attr('name') != current_select.attr('name')
      current_select.children().each ->
        $(this).attr('disabled', 'disabled')
        for variant in variant_selects_products
          if (variant[index + 1].toString() == $(this).val() && variant[position].toString() == option.toString())
            $(this).removeAttr('disabled')


    if ($("#" + current_select.attr('id') + " option:selected").attr('disabled') == 'disabled')
      current_select.children().each ->
        if $(this).attr('disabled') == undefined
          current_select.val $(this).val()


  # finding the actual variant ID and setting the hidden field for the order process
  current_variant = new Array
  $('#product_id').attr('value', undefined)
  $('.option_values').each (index) ->
    current_variant[index] = $(this).val()


  for variant in variant_selects_products
    if variant[1..variant.length].toString() == current_variant.toString()
      $('#product_id').attr('value', variant[0])


  if $('#product_id').attr('value') == undefined
    $('#product_id').html("The selected product is not available!")



jQuery ->

  if variant_selects_products == undefined
     alert "Variable variant_selects_products must be set!"

  # setting the first variant in the selct fields
  $('.option_values').each (index) ->
    $(this).val(variant_selects_products[0][index + 1])

  enableDisableOptions $('.option_values').first(), variant_selects_products[0][1]

  $('.option_values').change ->
    option_val = $("#" + $(this).attr('id') + " option:selected").val()
    enableDisableOptions $(this), option_val

