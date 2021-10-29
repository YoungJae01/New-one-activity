#프로그램에서 사용할 데이터 영역
    .data
msg: .asciiz "Sum of odd numbers: " #출력할메시지
number: .word 100 #연산 사용 수

#프로그램의 코드 영역
    .text
    .globl main
main:
 
lw		$s0, number		# s0레지스터에 100을 가져옴
#작성

lui     $t1, 0		# $t1 = 0으로 초기화
lui     $t2, 0      # $t2 = 0으로 초기화
    
loop:
#작성
addi    $t1, $t1, 2         # $t1 = $t1 + 2
add	    $t2, $t1, $t2		# $t2 = $t1 + $t2
beq     $t1, $s0, exit      # $t1과 $s0(100)이 같으면 exit으로

j loop

exit:


    #결과를 출력
    #msg로 레이블된 메세지 출력
    li		$v0, 4 		
    la		$a0, msg
    syscall

    #값을 출력하는 부분
    #최종 결과는 $t2레지스터에 저장되어 있다고 가정하고
    #t2레지스터 값 출력
    li		$v0, 1 	
    addi	$a0, $t2, 0			# $a0 = $21 + 0
    syscall

    #프로그램 종료
    li		$v0,10 		# exit
    syscall 
    

