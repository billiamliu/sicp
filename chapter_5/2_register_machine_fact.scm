(controller
  test-b
    (test (op >) (reg b) (const n))
    (branch (label fact-done))
    (assign a (op *) (reg a) (reg b))
    (assign b (op +) (reg b) (const 1))
    (goto (label test-b))
fact-done)
