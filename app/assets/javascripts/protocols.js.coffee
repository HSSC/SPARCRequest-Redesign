$ ->
  $(document).on 'click', '.substeps-nav .nav-link, a.back', (event) ->
    event.preventDefault()
    setActiveSubStep($(this).attr('href'))

  $(document).on 'click', '.validate', ->
    $.ajax
      type: 'get'
      dataType: 'script'
      url: '/protocol/validate'
      data:
        group: $(this).data('group')
        href: $(this).data('href')
        type: getProtocolType()

(exports ? this).getProtocolType = () ->
  type = (new URL(window.location)).searchParams.get('type')

(exports ? this).setActiveSubStep = (href=window.location.hash) ->
  # Prevent scrolls when no hash is present or
  # when clicking the same link as the hash
  if href && href != window.location.hash
    window.location.hash = href

  if href.length == 0
    $(".substep-link#protocolInformation, .substep#protocolInformationSection").addClass('active')
  else
    $('.substep-link.active, .substep.active').removeClass('active')
    $(".substep-link#{href}, .substep#{href}Section").addClass('active')
