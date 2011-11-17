//= require store/spree_core

function enableDisableOptions(select, option) {
  var position;
  $('.option_values').each(function (index) {
    if (select.attr('name') == $(this).attr('name'))
      position = index + 1;
  });

  $('.option_values').each(function (index) {
    var current_select = $(this);
    if (select.attr('name') != current_select.attr('name')) {
      current_select.children().each(function () {
        $(this).attr('disabled', 'disabled');
        for (var i = variant_selects_products.length - 1; i >= 0; --i) {
          if (variant_selects_products[i][index + 1] == $(this).val() && variant_selects_products[i][position] == option) {
            $(this).removeAttr('disabled');
          }
        }
      });

      if ($("#" + current_select.attr('id') + " option:selected").attr('disabled') == 'disabled') {
        current_select.children().each(function () {
          if ($(this).attr('disabled') == undefined) {
            current_select.val($(this).val());
          }
        });
      }

    }
  });

  // finding the actual variant ID and setting the hidden field for the order process
  var current_variant = new Array();
  $('#product_id').attr('value', undefined);
  $('.option_values').each(function (index) {
    current_variant[index] = $(this).val();
  });

  for (var i = variant_selects_products.length - 1; i >= 0; --i) {
    if (variant_selects_products[i].slice(1, variant_selects_products.length).toString() == current_variant.toString()) {
      $('#product_id').attr('value', variant_selects_products[i][0]);
    }
  }

  if ($('#product_id').attr('value') == undefined)
    $('#product_id').html("The selected product is not available!");

}

$(function () {

  if (variant_selects_products == undefined)
    alert("Variable variant_selects_products must be set!");

  //setting the first variant in the selct fields
  $('.option_values').each(function (index) {
    $(this).val(variant_selects_products[0][index + 1]);
  });

  enableDisableOptions($('.option_values').first(), variant_selects_products[0][1]);

  $('.option_values').change(function () {
    var option_val = $("#" + $(this).attr('id') + " option:selected").val();
    enableDisableOptions($(this), option_val);
  });
});
