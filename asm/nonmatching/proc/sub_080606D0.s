	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080606D0
sub_080606D0: @ 0x080606D0
	push {r4, r5, lr}
	sub sp, #4
	movs r1, #0
	mov r0, sp
	strh r1, [r0]
	bl sub_08060D78
	bl sub_08060DAC
	adds r4, r0, #0
	movs r0, #0x15
	bl sub_08057FE8
	ldr r1, _08060710 @ =gUnknown_030045D8
	str r0, [r1]
	cmp r4, #0
	ble _08060702
	mov r5, sp
_080606F4:
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl sub_08060718
	subs r4, #1
	cmp r4, #0
	bne _080606F4
_08060702:
	ldr r1, _08060714 @ =gUnknown_03004780
	movs r0, #4
	strh r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060710: .4byte gUnknown_030045D8
_08060714: .4byte gUnknown_03004780

