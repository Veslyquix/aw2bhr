	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080145BC
sub_080145BC: @ 0x080145BC
	push {lr}
	ldr r1, _080145DC @ =gUnknown_03002514
	ldrb r0, [r1]
	cmp r0, #2
	bne _080145CA
	movs r0, #0
	strb r0, [r1]
_080145CA:
	ldr r0, _080145E0 @ =gUnknown_0848A398
	bl sub_0801537C
	ldr r0, _080145E4 @ =gUnknown_0848A3C4
	bl sub_0801537C
	pop {r0}
	bx r0
	.align 2, 0
_080145DC: .4byte gUnknown_03002514
_080145E0: .4byte gUnknown_0848A398
_080145E4: .4byte gUnknown_0848A3C4

