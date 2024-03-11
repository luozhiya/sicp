<TeXmacs|2.1.2>

<style|<tuple|course|british|smart-ref|preview-ref|doc>>

<\body>
  <\exercise>
    Below is a sequence of expressions. What is the result printed by the
    interpreter in response to each expression? Assume that the sequence is
    to be evaluated in the order in which it is presented.

    <\session|scheme|default>
      <\unfolded-io|Scheme] >
        10
      <|unfolded-io>
        10
      </unfolded-io>

      <\unfolded-io|Scheme] >
        (+ 5 3 4)
      <|unfolded-io>
        12
      </unfolded-io>

      <\unfolded-io|Scheme] >
        (- 9 1)
      <|unfolded-io>
        8
      </unfolded-io>

      <\unfolded-io|Scheme] >
        (/ 6 2)
      <|unfolded-io>
        3
      </unfolded-io>

      <\unfolded-io|Scheme] >
        (+ (* 2 4) (- 4 6))
      <|unfolded-io>
        6
      </unfolded-io>

      <\unfolded-io|Scheme] >
        (define a 3)
      <|unfolded-io>
        3
      </unfolded-io>

      <\unfolded-io|Scheme] >
        (define b (+ a 1))
      <|unfolded-io>
        4
      </unfolded-io>

      <\unfolded-io|Scheme] >
        (+ a b (* a b))
      <|unfolded-io>
        19
      </unfolded-io>

      <\unfolded-io|Scheme] >
        (= a b)
      <|unfolded-io>
        #f
      </unfolded-io>

      <\unfolded-io|Scheme] >
        (if (and (\<gtr\> b a) (\<less\> b (* a b)))

        \ \ \ \ b

        \ \ \ \ a)
      <|unfolded-io>
        4
      </unfolded-io>

      <\unfolded-io|Scheme] >
        (cond ((= a 4) 6)

        \ \ \ \ \ \ ((= b 4) (+ 6 7 a))

        \ \ \ \ \ \ (else 25))
      <|unfolded-io>
        16
      </unfolded-io>

      <\unfolded-io|Scheme] >
        (+ 2 (if (\<gtr\> b a) b a))
      <|unfolded-io>
        6
      </unfolded-io>

      <\unfolded-io|Scheme] >
        (* (cond ((\<gtr\> a b) a)

        \ \ \ \ \ \ \ \ \ ((\<less\> a b) b)

        \ \ \ \ \ \ \ \ \ (else -1)))
      <|unfolded-io>
        4
      </unfolded-io>
    </session>
  </exercise>

  <\exercise>
    Translate the following expression into prefix form:
    <math|<frac|5+4+<around*|(|2-<around*|(|3-<around*|(|6+<frac|4|5>|)>|)>|)>|3<around*|(|6-2|)><around*|(|2-7|)>>>.
  </exercise>

  <\session|scheme|default>
    <\unfolded-io|Scheme] >
      (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))
    <|unfolded-io>
      -37/150
    </unfolded-io>

    <\input|Scheme] >
      \;
    </input>
  </session>

  <\unfolded>
    <\exercise>
      Define a procedure that takes three numbers as arguments and returns
      the sum of the squares of the two larger numbers.
    </exercise>
  <|unfolded>
    <\solution*>
      \;

      <\session|scheme|default>
        <\unfolded-io|Scheme] >
          (define (ex3-sum_of_squares x y)

          \ \ (+ (* x x) (* y y)))
        <|unfolded-io>
          ex3-sum_of_squares
        </unfolded-io>

        <\unfolded-io|Scheme] >
          (define (ex3-larger x y z)

          \ \ (cond ((and (\<gtr\> y x) (\<gtr\> z x)) (values y z))

          \ \ \ \ \ \ \ \ ((and (\<gtr\> x y) (\<gtr\> z y)) (values x z))

          \ \ \ \ \ \ \ \ ((and (\<gtr\> x z) (\<gtr\> y z)) (values x y))))
        <|unfolded-io>
          ex3-larger
        </unfolded-io>

        <\unfolded-io|Scheme] >
          (ex3-sum_of_squares (ex3-larger 1 2 3))
        <|unfolded-io>
          13
        </unfolded-io>

        <\unfolded-io|Scheme] >
          (ex3-sum_of_squares (ex3-larger 2 1 3))
        <|unfolded-io>
          13
        </unfolded-io>

        <\unfolded-io|Scheme] >
          (ex3-sum_of_squares (ex3-larger 2 3 1))
        <|unfolded-io>
          13
        </unfolded-io>
      </session>
    </solution*>
  </unfolded>

  <\unfolded>
    <\exercise>
      \ Observe that our model of evaluation allows for combinations whose
      operators are compound expressions. Use this observation to describe
      the behavior of the following procedure:

      <\scm-code>
        (define (a-plus-abs-b a b)

        \ \ ((if (\<gtr\> b 0) + -) a b))
      </scm-code>
    </exercise>
  <|unfolded>
    <\solution*>
      \;

      Simplify (operator a b)

      Operator is a subexpression, evaluating the value of left most
      subexpression (the operator).
    </solution*>
  </unfolded>

  <\unfolded>
    <\exercise>
      <label|ex1.5>Ben Bitdiddle has invented a test to determine whether the
      interpreter he is faced with is using applicative-order evaluation or
      normal-order evaluation. He defines the following two procedures:

      <\scm-code>
        (define (p) (p))

        \;

        (define (test x y)

        \ \ (if (= x 0)

        \ \ \ \ \ \ 0

        \ \ \ \ \ \ y))
      </scm-code>

      Then he evaluates the expression

      <\scm-code>
        (test 0 (p))
      </scm-code>

      What behavior will Ben observe with an interpreter that uses
      applicative-order evaluation? What behavior will he observe with an
      interpreter that uses normal-order evaluation? Explain your answer.
      (Assume that the evaluation rule for the special form <code*|if> is the
      same whether the interpreter is using normal or applicative order: The
      predicate expression is evaluated first, and the result determines
      whether to evaluate the consequent or the alternative expression.)
    </exercise>
  <|unfolded>
    <\solution*>
      \;

      <\itemize>
        <item>applicative-order

        <\indent>
          <\itemize>
            <item>evaluation: infinite recursion

            <item>When calling <scm|(test 0 (p))>, it evaluates <scm|(p)>,
            which leads to infinite recursion
          </itemize>
        </indent>

        <item>normal-order

        <\indent>
          <\itemize>
            <item>evaluation: 0

            <item>When calling <scm|(test 0 (p))>, expand to\ 

            <\scm-code>
              (if (= 0 0)

              \ \ \ \ 0

              \ \ \ \ (p))
            </scm-code>

            \ Obviously, 0=0, the \<langle\>predicate\<rangle\> of <scm|if>
            evaluates to a <scm|#t> value. <scm|if> statements do not
            evaluate <scm|(p)>
          </itemize>
        </indent>
      </itemize>
    </solution*>
  </unfolded>

  <\unfolded>
    <\exercise>
      Alyssa P. Hacker doesn't see why <code*|if> needs to be provided as a
      special form. \PWhy can't I just define it as an ordinary procedure in
      terms of <code*|cond>?\Q she asks. Alyssa's friend Eva Lu Ator claims
      this can indeed be done, and she defines a new version of <code*|if>:

      <\scm-code>
        (define (new-if predicate then-clause else-clause)

        \ \ (cond (predicate then-clause)

        \ \ \ \ \ \ \ \ (else else-clause)))
      </scm-code>

      Eva demonstrates the program for Alyssa:

      <\scm-code>
        (new-if (= 2 3) 0 5)

        <with|font-shape|italic|5>

        \;

        (new-if (= 1 1) 0 5)

        <with|font-shape|italic|0>
      </scm-code>

      Delighted, Alyssa uses <code*|new-if> to rewrite the square-root
      program:

      <\scm-code>
        (define (sqrt-iter guess x)

        \ \ (new-if (good-enough? guess x)

        \ \ \ \ \ \ \ \ \ \ guess

        \ \ \ \ \ \ \ \ \ \ (sqrt-iter (improve guess x)

        \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ x)))
      </scm-code>

      What happens when Alyssa attempts to use this to compute square roots?
      Explain.
    </exercise>
  <|unfolded>
    <\session|scheme|default>
      <\solution*>
        \;

        \;

        <\itemize>
          <item><scm|if> version
        </itemize>

        <\session|scheme|default>
          <\unfolded-io|Scheme] >
            (define (ex6-square x) (* x x))
          <|unfolded-io>
            ex6-square
          </unfolded-io>

          <\unfolded-io|Scheme] >
            (define (ex6-average x y)

            \ \ (/ (+ x y) 2))
          <|unfolded-io>
            ex6-average
          </unfolded-io>

          <\unfolded-io|Scheme] >
            (define (ex6-improve guess x)

            \ \ (ex6-average guess (/ x guess)))
          <|unfolded-io>
            ex6-improve
          </unfolded-io>

          <\unfolded-io|Scheme] >
            (define (ex6-good-enough? guess x)

            \ \ (\<less\> (abs (- (ex6-square guess) x)) 0.001))
          <|unfolded-io>
            ex6-good-enough?
          </unfolded-io>

          <\unfolded-io|Scheme] >
            (define (ex6-sqrt-iter guess x)

            \ \ (if (ex6-good-enough? guess x)

            \ \ \ \ \ \ guess

            \ \ \ \ \ \ (ex6-sqrt-iter (ex6-improve guess x)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ x)))
          <|unfolded-io>
            ex6-sqrt-iter
          </unfolded-io>

          <\unfolded-io|Scheme] >
            (define (ex6-sqrt x)

            \ \ (ex6-sqrt-iter 1.0 x))
          <|unfolded-io>
            ex6-sqrt
          </unfolded-io>

          <\unfolded-io|Scheme] >
            (ex6-sqrt 9)
          <|unfolded-io>
            3.00009155413138
          </unfolded-io>

          \;

          <\itemize>
            <item><scm|new-if> version
          </itemize>

          <\session|scheme|default>
            <\unfolded-io|Scheme] >
              (define (ex6-new-if predicate then-clause else-clause)

              \ \ (cond (predicate then-clause)

              \ \ \ \ \ \ \ \ (else else-clause)))
            <|unfolded-io>
              ex6-new-if
            </unfolded-io>

            <\unfolded-io|Scheme] >
              (define (ex6-new-sqrt-iter guess x)

              \ \ (ex6-new-if (ex6-good-enough? guess x)

              \ \ \ \ \ \ \ \ \ \ guess

              \ \ \ \ \ \ \ \ \ \ (ex6-new-sqrt-iter (ex6-improve guess x)

              \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ x)))
            <|unfolded-io>
              ex6-new-sqrt-iter
            </unfolded-io>

            <\unfolded-io|Scheme] >
              (define (ex6-new-sqrt x)

              \ \ (ex6-new-sqrt-iter 1.0 x))
            <|unfolded-io>
              ex6-new-sqrt
            </unfolded-io>

            <\unfolded-io|Scheme] >
              ;(ex6-new-sqrt 9)
            <|unfolded-io>
              #\<less\>eof\<gtr\>
            </unfolded-io>
          </session>
        </session>

        \;

        <\itemize>
          <item>Conclusion

          <\indent>
            <\itemize>
              <item><scm|new-if> is a procedure that evaluates each operand
              first when called.

              <item>When evaluating <scm|else-clause>, it will fall into
              infinite recursion
            </itemize>
          </indent>

          <\indent>
            \;
          </indent>
        </itemize>
      </solution*>
    </session>
  </unfolded>

  <\unfolded>
    <\exercise>
      <label|ex1.7>The <code*|good-enough?> test used in computing square
      roots will not be very effective for finding the square roots of very
      small numbers. Also, in real computers, arithmetic operations are
      almost always performed with limited precision. This makes our test
      inadequate for very large numbers. Explain these statements, with
      examples showing how the test fails for small and large numbers. An
      alternative strategy for implementing <code*|good-enough?> is to watch
      how <code*|guess> changes from one iteration to the next and to stop
      when the change is a very small fraction of the guess. Design a
      square-root procedure that uses this kind of end test. Does this work
      better for small and large numbers?
    </exercise>
  <|unfolded>
    <\solution*>
      \;
    </solution*>

    <\itemize>
      <item>Showing how the test fails for small and large numbers.
    </itemize>

    <\session|scheme|default>
      <\unfolded-io|Scheme] >
        (ex6-square (ex6-sqrt 1.123456789e-12))
      <|unfolded-io>
        9.765625007482396e-4
      </unfolded-io>

      <\session|scheme|default>
        <\unfolded-io|Scheme] >
          (ex6-square (sqrt 1.123456789e-12))
        <|unfolded-io>
          1.1234567889999999e-12
        </unfolded-io>
      </session>

      <\unfolded-io|Scheme] >
        ;(ex6-square (ex6-sqrt 9.98765432198e+12))

        ; Busy

        ; Can't compute
      <|unfolded-io>
        #\<less\>eof\<gtr\>
      </unfolded-io>

      <\unfolded-io|Scheme] >
        (ex6-square (sqrt 9.98765432198e+12))
      <|unfolded-io>
        9987654321980.0
      </unfolded-io>

      \;

      <\itemize>
        <item>Improved <scm|good-enough?>
      </itemize>

      <\session|scheme|default>
        <\unfolded-io|Scheme] >
          (define (ex7-square x) (* x x))
        <|unfolded-io>
          ex7-square
        </unfolded-io>

        <\unfolded-io|Scheme] >
          (define (ex7-average x y) (/ (+ x y) 2))
        <|unfolded-io>
          ex7-average
        </unfolded-io>

        <\unfolded-io|Scheme] >
          (define (ex7-improve guess x)

          \ \ (ex7-average guess (/ x guess)))
        <|unfolded-io>
          ex7-improve
        </unfolded-io>

        <\unfolded-io|Scheme] >
          (define (ex7-good-enough? pre-guess guess)

          \ \ (\<less\> (/ (abs (- pre-guess guess)) guess) 0.001))
        <|unfolded-io>
          ex7-good-enough?
        </unfolded-io>

        <\unfolded-io|Scheme] >
          (define (ex7-sqrt-iter pre-guess guess x)

          \ \ (if (ex7-good-enough? pre-guess guess)

          \ \ \ \ \ \ guess

          \ \ \ \ \ \ (ex7-sqrt-iter guess

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (ex7-improve guess x)

          \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ x)))
        <|unfolded-io>
          ex7-sqrt-iter
        </unfolded-io>

        <\unfolded-io|Scheme] >
          (define (ex7-sqrt x)

          \ \ (ex7-sqrt-iter 0.0 1.0 x))
        <|unfolded-io>
          ex7-sqrt
        </unfolded-io>

        <\session|scheme|default>
          <\unfolded-io|Scheme] >
            (ex6-square (ex7-sqrt 1.123456789e-12))
          <|unfolded-io>
            1.1234568740513339e-12
          </unfolded-io>

          <\unfolded-io|Scheme] >
            (ex6-square (sqrt 1.123456789e-12))
          <|unfolded-io>
            1.1234567889999999e-12
          </unfolded-io>
        </session>

        <\unfolded-io|Scheme] >
          (ex6-square (ex7-sqrt 9.98765432198e+12))
        <|unfolded-io>
          9987654345933.438
        </unfolded-io>

        <\unfolded-io|Scheme] >
          (ex6-square (sqrt 9.98765432198e+12))
        <|unfolded-io>
          9987654321980.0
        </unfolded-io>

        \;

        <\itemize>
          <item>Conclusion
        </itemize>

        \;

        Compare with standard library sqrt
      </session>

      <block|<tformat|<table|<row|<cell|Value>|<cell|<scm|sqrt>>|<cell|<scm|ex6-sqrt>>|<cell|<scm|ex7-sqrt>>>|<row|<cell|1.123456789e-12>|<cell|1.1234567889999999e-12>|<cell|9.765625007482396e-4>|<cell|1.1234568740513339e-12>>|<row|<cell|9.98765432198e+12>|<cell|9987654321980.0>|<cell|Busy
      (Can't compute)>|<cell|9987654345933.438>>>>>
    </session>

    \;

    The gap with the standard library sqrt

    <\session|scheme|default>
      <\unfolded-io|Scheme] >
        (abs (- 1.123456789e-12 1.1234567889999999e-12))
      <|unfolded-io>
        0.0
      </unfolded-io>

      <\unfolded-io|Scheme] >
        (abs (- 1.123456789e-12 9.765625007482396e-4))
      <|unfolded-io>
        9.765624996247828e-4
      </unfolded-io>

      <\unfolded-io|Scheme] >
        (abs (- 1.123456789e-12 1.1234568740513339e-12))
      <|unfolded-io>
        8.50513339973876e-20
      </unfolded-io>

      <\unfolded-io|Scheme] >
        (abs (- 9.98765432198e+12 9987654321980.0))
      <|unfolded-io>
        0.0
      </unfolded-io>

      <\unfolded-io|Scheme] >
        (abs (- 9.98765432198e+12 9987654345933.438))
      <|unfolded-io>
        23953.4375
      </unfolded-io>
    </session>

    <block|<tformat|<table|<row|<cell|Value>|<cell|<scm|sqrt>>|<cell|<scm|ex6-sqrt>>|<cell|<scm|ex7-sqrt>>>|<row|<cell|1.123456789e-12>|<cell|0.0>|<cell|9.765624996247828e-4>|<cell|8.50513339973876e-20>>|<row|<cell|9.98765432198e+12>|<cell|0.0>|<cell|FIN>|<cell|23953.4375>>>>>
  </unfolded>

  <\exercise>
    Newton's method for cube roots is based on the fact that if <math|y> is
    an approximation to the cube root of <math|x>, then a better
    approximation is given by the value <math|<frac|x<around*|/|y<rsup|2>+2*y|\<nobracket\>>|3>>.
    Use this formula to implement a cube-root procedure analogous to the
    square-root procedure. (In Section 1.3.4 we will see how to implement
    Newton's method in general as an abstraction of these square-root and
    cube-root procedures.)

    <\unfolded>
      \;
    <|unfolded>
      <\solution*>
        \;

        <\session|scheme|default>
          <\unfolded-io|Scheme] >
            (define (ex8-square x) (* x x))
          <|unfolded-io>
            ex8-square
          </unfolded-io>

          <\unfolded-io|Scheme] >
            (define (ex8-improve x y)

            \ \ (/ (+ (/ x (ex8-square y)) (* 2 y)) 3))
          <|unfolded-io>
            ex8-improve
          </unfolded-io>

          <\unfolded-io|Scheme] >
            (define (ex8-good-enough? pre-guess guess)

            \ \ (\<less\> (/ (abs (- pre-guess guess)) guess) 0.001))
          <|unfolded-io>
            ex8-good-enough?
          </unfolded-io>

          <\unfolded-io|Scheme] >
            (define (ex8-cube-root-iter pre-guess guess x)

            \ \ (if (ex8-good-enough? pre-guess guess)

            \ \ \ \ \ \ guess

            \ \ \ \ \ \ (ex8-cube-root-iter guess

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ (ex8-improve
            x guess)

            \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ x)))
          <|unfolded-io>
            ex8-cube-root-iter
          </unfolded-io>

          <\unfolded-io|Scheme] >
            (define (ex8-cube-root x)

            \ \ (ex8-cube-root-iter 0.0 1.0 x))
          <|unfolded-io>
            ex8-cube-root
          </unfolded-io>

          <\unfolded-io|Scheme] >
            (ex8-cube-root 27)
          <|unfolded-io>
            3.0000005410641766
          </unfolded-io>

          <\unfolded-io|Scheme] >
            (ex8-cube-root 1.123456789e-12)
          <|unfolded-io>
            1.0395661470382135e-4
          </unfolded-io>

          <\unfolded-io|Scheme] >
            (ex8-cube-root 9.98765432198e+12)
          <|unfolded-io>
            2.153547730824831e+4
          </unfolded-io>
        </session>
      </solution*>
    </unfolded>
  </exercise>
</body>

<\initial>
  <\collection>
    <associate|page-medium|papyrus>
    <associate|page-screen-margin|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|ex1.5|<tuple|5|2>>
    <associate|ex1.7|<tuple|7|5>>
  </collection>
</references>