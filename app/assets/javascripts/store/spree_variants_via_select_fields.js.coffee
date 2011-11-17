class OptionHandler

  variant_selects_products:[]

  constructor:(variant_selects_products) ->
    @variant_selects_products = variant_selects_products

  valid:->
    @variant_selects_products.length > 0

  setToFirstVariant:->
    $('.option_values').each (index, element) =>
      $(element).val(@variant_selects_products[0][index + 1])

    this.enableDisableOptions $('.option_values').first(), @variant_selects_products[0][1]


  enableDisableOptions:(select, option) ->
    position = undefined
    $('.option_values').each (index) ->
      if select.attr('name') == $(this).attr('name')
        position = index + 1

    console.log @variant_selects_products
    $('.option_values').each (index, element) =>
      current_select = $(element)
      if select.attr('name') != current_select.attr('name')
        current_select.children().each (i, element) =>
          $(element).attr('disabled', 'disabled')
          for variant in @variant_selects_products
            if (variant[index + 1].toString() == $(element).val() && variant[position].toString() == option.toString())
              $(element).removeAttr('disabled')


      if ($("#" + current_select.attr('id') + " option:selected").attr('disabled') == 'disabled')
        current_select.children().each ->
          if $(this).attr('disabled') == undefined
            current_select.val $(this).val()


    # finding the actual variant ID and setting the hidden field for the order process
    current_variant = new Array
    $('#product_id').attr('value', undefined)
    $('.option_values').each (index) ->
      current_variant[index] = $(this).val()


    for variant in @variant_selects_products
      if variant[1..variant.length].toString() == current_variant.toString()
        $('#product_id').attr('value', variant[0])


    if $('#product_id').attr('value') == undefined
      $('#product_id').html("The selected product is not available!")


jQuery ->
  option_handler = new OptionHandler(variants)

  if !option_handler.valid
    alert "OptionHandler not initialised"

  option_handler.setToFirstVariant()

  option_val = undefined
  $('.option_values').change ->
    option_val = $("#" + $(this).attr('id') + " option:selected").val()
    option_handler.enableDisableOptions $(this), option_val

