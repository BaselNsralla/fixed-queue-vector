fixed <- function(vector, fixed_size) {
  if (!is.atomic(vector)) {
    stop('Chill down')
  }
  class(vector) <- 'fixed'
  vector[full_length(vector)+1] <- fixed_size
  return(vector)
}

print.fixed <- function(vec) {
  print(vec[-full_length(vec)])
}

full_length <- function(vec) {
  vec <- as.vector(vec)
  return(length(vec))
}

length.fixed <- function (vec){
  vec <- as.vector(vec)
  return(base::length(vec)-1)
}

push <- function(vec, value) {
  if (class(value) != class(vec[1])) {
    stop('Chill down with the types')
  }
  i <- full_length(vec)
  fixed_size <- vec[i]
  vec[i] <- value
  vec[i+1] <- fixed_size
  if (full_length(vec)-1 > fixed_size) {
    return(swipe(vec))
  }
  return(vec)
}

swipe <- function (vec) {
  print('swipe time')
  for (i in 1:(full_length(vec)-1)) {
    vec[i] <- vec[i+1]
  }
  vec <- vec[-full_length(vec)]
  class(vec) <- 'fixed'
  return(vec)
}
