/* 
A file for testing Stan syntax highlighting. 

It is not a real model and will not compile
*/
# also a comment
// also a comment
data {
  // valid name
  int abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_abc;
  // all types should be highlighed
  int a3;
  real foo[2];
  vector[3] bar;
  row_vector[3] baz;
  matrix[3,3] qux;
  simplex[3] quux;
  ordered[3] corge;
  positive_ordered[3] wibble;
  corr_matrix[3] grault;
  cov_matrix[3] garply;
  cholesky_factor_cov[3] waldo;
  
  real<lower=-1,upper=1> foo1;
  real<lower=0> foo2;
  real<upper=0> foo3;
}
transformed data {
  real xyzzy;
  int thud;
  row_vector grault2;
  matrix qux2;
  
  // all floating point literals should be recognized
  // all operators should be recognized
  // paren should be recognized;
  xyzzy <- 1234.5687 + .123 - (2.7e3 / 2E-5 * 135e-5);
  // integer literal
  thud <- -12309865;
  // ./ and .* should be recognized as operators
  grault2 <- grault .* garply ./ garply;
  // ' and \ should be regognized as operators
  qux2 <- qux' \ bar;
  
}
parameters {
  real fred;
  real plugh;
}
transformed parameters {    
}
model {
  // ~, <- are operators, 
  // T may be be recognized
  // normal is a function
  fred ~ normal(0, 1) T(-0.5, 0.5);
  real tmp;
  // C++ reserved
  real public;
  
  // control structures
  for (i in 1:10) {
    tmp <- tmp + 0.1;
  }
  tmp <- 0.0;
  while (tmp < 5.0) {
    tmp <- tmp + 1;
  }
  if (tmp > 0.0) {
    print(tmp);
  } else {
    print(tmp);
  }

  // operators
  tmp || tmp;
  tmp && tmp;
  tmp == tmp;
  tmp != tmp;   
  tmp < tmp;
  tmp <= tmp;
  tmp > tmp;
  tmp >= tmp;
  tmp + tmp;
  tmp - tmp;
  tmp * tmp;
  tmp / tmp;
  tmp .* tmp;
  tmp ./ tmp;
  ! tmp;
  - tmp;
  + tmp;
  tmp ';

  // lp__ should be highlighted
  // normal_log as a function
  lp__ <- lp__ + normal_log(plugh, 0, 1);
  increment_log_prob(normal_log(plugh, 0, 1));
  
  // print statement and string literal
  print("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_~@#$%^&*`'-+={}[].,;: ");
  print("Hello, world!");
  print("");
  
}
generated quantities {
  real bar1;
  bar1 <- foo + 1;
}

