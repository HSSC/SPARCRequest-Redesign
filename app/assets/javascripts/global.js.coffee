$ ->
  initializeTooltips()
  initializePopovers()
  setRequiredFields()
  finishPageLoad()

(exports ? this).initializeTooltips = () ->
  $('[data-toggle=tooltip]').tooltip()

(exports ? this).initializePopovers = () ->
  $('[data-toggle=popover').popover().each (index) ->
    klass = $(this).data('class')

    $(this).data('bs.popover').config.template = $(this).data('bs.popover').config.template.replace("class=\"popover\"", "class=\"popover popover-#{klass}\"")

(exports ? this).setRequiredFields = () ->
  $('.required').append('<span class="text-danger"> *</span>')

finishPageLoad = () ->
  # Prevent browser scrolling to href if hash is present
  if window.location.hash
    setTimeout (->
      window.scrollTo(0, 0)
    ), 1

  # Show the page
  $('body').addClass('active')
