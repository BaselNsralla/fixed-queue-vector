# Fixed Queue Vector

A vector that acts like a fixed queue.  

inserting values will push out the values at the start when the size exceeds that size you provide.

## Multi/single value:

```R
  fixed_value <- 8

  ## initializing the vector
  fixed_queue <- fixed(c('6','7','8','12', '123','44'), fixed_value)
 
  fixed_queue <- push(fixed_queue, value=c('222','333'))
  length(fixed_queue) # 8
  
  fixed_queue <- push(fixed_queue, value=c('44444','44444'))
  
  length(fixed_queue) # still 8 but different head
  
  # this recycled the 6,7 to give place to the fours
  print(fixed_queue) # 8, 12, 123, 44, 222, 333, 44444, 44444
```
 
## Strict single value insertions

```R
my_vector <- c(1,3,4,5,6)
my_fixed_size <- 6

fixed_queue <- fixed(my_vector, my_fixed_size)
fixed_queue <- push(fixed_queue, 12)
# fixed_queue is now 1,3,4,5,6,12

fixed_queue <- push(fixed_queue, 13)
# fixed queue is now 3,4,5,6,12,13

```

