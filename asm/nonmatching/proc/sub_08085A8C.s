	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08085A8C
sub_08085A8C: @ 0x08085A8C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x92
	movs r1, #0x38
	movs r2, #0x38
	movs r3, #0
	bl sub_0801F34C
	ldr r0, _08085AC0 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	ldr r0, _08085AC4 @ =0x00000103
	ands r0, r1
	cmp r0, #0
	beq _08085AB6
	adds r0, r4, #0
	bl Proc_Break
_08085AB6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085AC0: .4byte gpKeySt
_08085AC4: .4byte 0x00000103

