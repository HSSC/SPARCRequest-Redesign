$ ->
  $(document).on 'click', '.substeps-nav .nav-link', (event) ->
    event.preventDefault()
    setActiveSubStep($(this).attr('href'))

(exports ? this).setActiveSubStep = (href=window.location.hash) ->
  # Prevent scrolls when no hash is present or
  # when clicking the same link as the hash
  if href && href != window.location.hash
    window.location.hash = href

  if href.length == 0
    $(".substep-link#studyInformation, .substep#studyInformationSection").addClass('active')
  else
    $('.substep-link.active, .substep.active').removeClass('active')
    $(".substep-link#{href}, .substep#{href}Section").addClass('active')
