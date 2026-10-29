(module
    (export "a" (func $a))
    (func $a call $b) ;; 0
    (func $b call $c) ;; 1
    (func $c call $d) ;; 2
    (func $d call $e) ;; 3
    (func $e ) ;; 4
)
