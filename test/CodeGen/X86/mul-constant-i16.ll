; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown | FileCheck %s --check-prefix=X86
; RUN: llc < %s -mtriple=x86_64-unknown | FileCheck %s --check-prefix=X64

define i16 @test_mul_by_1(i16 %x) {
; X86-LABEL: test_mul_by_1:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_1:
; X64:       # BB#0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 1
  ret i16 %mul
}

define i16 @test_mul_by_2(i16 %x) {
; X86-LABEL: test_mul_by_2:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    addl %eax, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_2:
; X64:       # BB#0:
; X64-NEXT:    # kill: %EDI<def> %EDI<kill> %RDI<def>
; X64-NEXT:    leal (%rdi,%rdi), %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 2
  ret i16 %mul
}

define i16 @test_mul_by_3(i16 %x) {
; X86-LABEL: test_mul_by_3:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    leal (%eax,%eax,2), %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_3:
; X64:       # BB#0:
; X64-NEXT:    # kill: %EDI<def> %EDI<kill> %RDI<def>
; X64-NEXT:    leal (%rdi,%rdi,2), %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 3
  ret i16 %mul
}

define i16 @test_mul_by_4(i16 %x) {
; X86-LABEL: test_mul_by_4:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shll $2, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_4:
; X64:       # BB#0:
; X64-NEXT:    # kill: %EDI<def> %EDI<kill> %RDI<def>
; X64-NEXT:    leal (,%rdi,4), %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 4
  ret i16 %mul
}

define i16 @test_mul_by_5(i16 %x) {
; X86-LABEL: test_mul_by_5:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    leal (%eax,%eax,4), %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_5:
; X64:       # BB#0:
; X64-NEXT:    # kill: %EDI<def> %EDI<kill> %RDI<def>
; X64-NEXT:    leal (%rdi,%rdi,4), %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 5
  ret i16 %mul
}

define i16 @test_mul_by_6(i16 %x) {
; X86-LABEL: test_mul_by_6:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    addl %eax, %eax
; X86-NEXT:    leal (%eax,%eax,2), %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_6:
; X64:       # BB#0:
; X64-NEXT:    # kill: %EDI<def> %EDI<kill> %RDI<def>
; X64-NEXT:    addl %edi, %edi
; X64-NEXT:    leal (%rdi,%rdi,2), %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 6
  ret i16 %mul
}

define i16 @test_mul_by_7(i16 %x) {
; X86-LABEL: test_mul_by_7:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    leal (,%ecx,8), %eax
; X86-NEXT:    subl %ecx, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_7:
; X64:       # BB#0:
; X64-NEXT:    # kill: %EDI<def> %EDI<kill> %RDI<def>
; X64-NEXT:    leal (,%rdi,8), %eax
; X64-NEXT:    subl %edi, %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 7
  ret i16 %mul
}

define i16 @test_mul_by_8(i16 %x) {
; X86-LABEL: test_mul_by_8:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shll $3, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_8:
; X64:       # BB#0:
; X64-NEXT:    # kill: %EDI<def> %EDI<kill> %RDI<def>
; X64-NEXT:    leal (,%rdi,8), %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 8
  ret i16 %mul
}

define i16 @test_mul_by_9(i16 %x) {
; X86-LABEL: test_mul_by_9:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    leal (%eax,%eax,8), %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_9:
; X64:       # BB#0:
; X64-NEXT:    # kill: %EDI<def> %EDI<kill> %RDI<def>
; X64-NEXT:    leal (%rdi,%rdi,8), %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 9
  ret i16 %mul
}

define i16 @test_mul_by_10(i16 %x) {
; X86-LABEL: test_mul_by_10:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    addl %eax, %eax
; X86-NEXT:    leal (%eax,%eax,4), %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_10:
; X64:       # BB#0:
; X64-NEXT:    # kill: %EDI<def> %EDI<kill> %RDI<def>
; X64-NEXT:    addl %edi, %edi
; X64-NEXT:    leal (%rdi,%rdi,4), %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 10
  ret i16 %mul
}

define i16 @test_mul_by_11(i16 %x) {
; X86-LABEL: test_mul_by_11:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    imull $11, %eax, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_11:
; X64:       # BB#0:
; X64-NEXT:    imull $11, %edi, %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 11
  ret i16 %mul
}

define i16 @test_mul_by_12(i16 %x) {
; X86-LABEL: test_mul_by_12:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shll $2, %eax
; X86-NEXT:    leal (%eax,%eax,2), %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_12:
; X64:       # BB#0:
; X64-NEXT:    # kill: %EDI<def> %EDI<kill> %RDI<def>
; X64-NEXT:    shll $2, %edi
; X64-NEXT:    leal (%rdi,%rdi,2), %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 12
  ret i16 %mul
}

define i16 @test_mul_by_13(i16 %x) {
; X86-LABEL: test_mul_by_13:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    imull $13, %eax, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_13:
; X64:       # BB#0:
; X64-NEXT:    imull $13, %edi, %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 13
  ret i16 %mul
}

define i16 @test_mul_by_14(i16 %x) {
; X86-LABEL: test_mul_by_14:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    imull $14, %eax, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_14:
; X64:       # BB#0:
; X64-NEXT:    imull $14, %edi, %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 14
  ret i16 %mul
}

define i16 @test_mul_by_15(i16 %x) {
; X86-LABEL: test_mul_by_15:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    leal (%eax,%eax,4), %eax
; X86-NEXT:    leal (%eax,%eax,2), %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_15:
; X64:       # BB#0:
; X64-NEXT:    # kill: %EDI<def> %EDI<kill> %RDI<def>
; X64-NEXT:    leal (%rdi,%rdi,4), %eax
; X64-NEXT:    leal (%rax,%rax,2), %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 15
  ret i16 %mul
}

define i16 @test_mul_by_16(i16 %x) {
; X86-LABEL: test_mul_by_16:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shll $4, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_16:
; X64:       # BB#0:
; X64-NEXT:    shll $4, %edi
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 16
  ret i16 %mul
}

define i16 @test_mul_by_17(i16 %x) {
; X86-LABEL: test_mul_by_17:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movl %ecx, %eax
; X86-NEXT:    shll $4, %eax
; X86-NEXT:    addl %ecx, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_17:
; X64:       # BB#0:
; X64-NEXT:    # kill: %EDI<def> %EDI<kill> %RDI<def>
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    shll $4, %eax
; X64-NEXT:    leal (%rax,%rdi), %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 17
  ret i16 %mul
}

define i16 @test_mul_by_18(i16 %x) {
; X86-LABEL: test_mul_by_18:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    addl %eax, %eax
; X86-NEXT:    leal (%eax,%eax,8), %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_18:
; X64:       # BB#0:
; X64-NEXT:    # kill: %EDI<def> %EDI<kill> %RDI<def>
; X64-NEXT:    addl %edi, %edi
; X64-NEXT:    leal (%rdi,%rdi,8), %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 18
  ret i16 %mul
}

define i16 @test_mul_by_19(i16 %x) {
; X86-LABEL: test_mul_by_19:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    imull $19, %eax, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_19:
; X64:       # BB#0:
; X64-NEXT:    imull $19, %edi, %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 19
  ret i16 %mul
}

define i16 @test_mul_by_20(i16 %x) {
; X86-LABEL: test_mul_by_20:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shll $2, %eax
; X86-NEXT:    leal (%eax,%eax,4), %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_20:
; X64:       # BB#0:
; X64-NEXT:    # kill: %EDI<def> %EDI<kill> %RDI<def>
; X64-NEXT:    shll $2, %edi
; X64-NEXT:    leal (%rdi,%rdi,4), %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 20
  ret i16 %mul
}

define i16 @test_mul_by_21(i16 %x) {
; X86-LABEL: test_mul_by_21:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    imull $21, %eax, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_21:
; X64:       # BB#0:
; X64-NEXT:    imull $21, %edi, %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 21
  ret i16 %mul
}

define i16 @test_mul_by_22(i16 %x) {
; X86-LABEL: test_mul_by_22:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    imull $22, %eax, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_22:
; X64:       # BB#0:
; X64-NEXT:    imull $22, %edi, %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 22
  ret i16 %mul
}

define i16 @test_mul_by_23(i16 %x) {
; X86-LABEL: test_mul_by_23:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    imull $23, %eax, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_23:
; X64:       # BB#0:
; X64-NEXT:    imull $23, %edi, %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 23
  ret i16 %mul
}

define i16 @test_mul_by_24(i16 %x) {
; X86-LABEL: test_mul_by_24:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shll $3, %eax
; X86-NEXT:    leal (%eax,%eax,2), %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_24:
; X64:       # BB#0:
; X64-NEXT:    # kill: %EDI<def> %EDI<kill> %RDI<def>
; X64-NEXT:    shll $3, %edi
; X64-NEXT:    leal (%rdi,%rdi,2), %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 24
  ret i16 %mul
}

define i16 @test_mul_by_25(i16 %x) {
; X86-LABEL: test_mul_by_25:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    leal (%eax,%eax,4), %eax
; X86-NEXT:    leal (%eax,%eax,4), %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_25:
; X64:       # BB#0:
; X64-NEXT:    # kill: %EDI<def> %EDI<kill> %RDI<def>
; X64-NEXT:    leal (%rdi,%rdi,4), %eax
; X64-NEXT:    leal (%rax,%rax,4), %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 25
  ret i16 %mul
}

define i16 @test_mul_by_26(i16 %x) {
; X86-LABEL: test_mul_by_26:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    imull $26, %eax, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_26:
; X64:       # BB#0:
; X64-NEXT:    imull $26, %edi, %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 26
  ret i16 %mul
}

define i16 @test_mul_by_27(i16 %x) {
; X86-LABEL: test_mul_by_27:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    leal (%eax,%eax,8), %eax
; X86-NEXT:    leal (%eax,%eax,2), %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_27:
; X64:       # BB#0:
; X64-NEXT:    # kill: %EDI<def> %EDI<kill> %RDI<def>
; X64-NEXT:    leal (%rdi,%rdi,8), %eax
; X64-NEXT:    leal (%rax,%rax,2), %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 27
  ret i16 %mul
}

define i16 @test_mul_by_28(i16 %x) {
; X86-LABEL: test_mul_by_28:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    imull $28, %eax, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_28:
; X64:       # BB#0:
; X64-NEXT:    imull $28, %edi, %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 28
  ret i16 %mul
}

define i16 @test_mul_by_29(i16 %x) {
; X86-LABEL: test_mul_by_29:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    imull $29, %eax, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_29:
; X64:       # BB#0:
; X64-NEXT:    imull $29, %edi, %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 29
  ret i16 %mul
}

define i16 @test_mul_by_30(i16 %x) {
; X86-LABEL: test_mul_by_30:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    imull $30, %eax, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_30:
; X64:       # BB#0:
; X64-NEXT:    imull $30, %edi, %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 30
  ret i16 %mul
}

define i16 @test_mul_by_31(i16 %x) {
; X86-LABEL: test_mul_by_31:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movl %ecx, %eax
; X86-NEXT:    shll $5, %eax
; X86-NEXT:    subl %ecx, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_31:
; X64:       # BB#0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    shll $5, %eax
; X64-NEXT:    subl %edi, %eax
; X64-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 31
  ret i16 %mul
}

define i16 @test_mul_by_32(i16 %x) {
; X86-LABEL: test_mul_by_32:
; X86:       # BB#0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shll $5, %eax
; X86-NEXT:    # kill: %AX<def> %AX<kill> %EAX<kill>
; X86-NEXT:    retl
;
; X64-LABEL: test_mul_by_32:
; X64:       # BB#0:
; X64-NEXT:    shll $5, %edi
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    retq
  %mul = mul nsw i16 %x, 32
  ret i16 %mul
}
