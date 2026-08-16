	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08086E54
sub_08086E54: @ 0x08086E54
	push {r4, r5, r6, r7, lr}
	movs r4, #0
	movs r1, #0
	ldr r0, _08086EA4 @ =gUnknown_0849957C
	mov ip, r0
	movs r0, #0x80
	lsls r0, r0, #2
	adds r7, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #7
	adds r6, r0, #0
_08086E6A:
	adds r5, r1, #1
	lsls r2, r1, #6
	movs r3, #9
_08086E70:
	mov r0, ip
	ldr r1, [r0]
	adds r1, r2, r1
	adds r0, r4, r7
	orrs r0, r6
	strh r0, [r1]
	adds r4, #1
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _08086E70
	adds r1, r5, #0
	cmp r1, #7
	ble _08086E6A
	ldr r1, _08086EA8 @ =gUnknown_03005918
	movs r0, #0x14
	str r0, [r1]
	ldr r1, _08086EAC @ =gUnknown_030058F4
	movs r0, #0x10
	str r0, [r1]
	bl sub_08013AFC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086EA4: .4byte gUnknown_0849957C
_08086EA8: .4byte gUnknown_03005918
_08086EAC: .4byte gUnknown_030058F4

