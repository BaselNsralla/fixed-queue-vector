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

push <- function (vec, value) {
  if (class(value) != class(vec[1])) {
    stop('Chill down with the types')
  }
  
  i <- full_length(vec)
  fixed_size <- as.numeric(vec[i])
  
  value <- c(value)
  value_len <- length(value)
  vec_len <- length(vec)
  
  ## MAKE THE VECTOR SMALLER if longer than max
  if (value_len > fixed_size) {
    diff <- value_len - fixed_size
    value <- value[-c(1:diff)]
  }
  
  ## HERE WE DO SWIPE with deletion to older values
  uncut_length <- length(vec) + length(value)
  if (uncut_length > fixed_size) {
    cycled_index <- uncut_length - fixed_size
    vec <- vec[-c(1:cycled_index)]
  }
  
  vec <- vec[-full_length(vec)]
  vec <- c(vec, value)
  ## the CLASS is removed in this case ?
  vec[full_length(vec)+1] <- fixed_size
  class(vec) <- 'fixed'
  return(vec)
}






