	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080408A0
sub_080408A0: @ 0x080408A0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804095A
	bl sub_08023824
	bl sub_0802361C
	movs r0, #4
	bl sub_08023908
	movs r0, #2
	movs r1, #0x12
	bl sub_080232CC
	bl sub_0802DBF8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804095A
	ldr r0, _08040918 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804092C
	adds r0, r5, #0
	bl sub_0804096C
	ldr r1, _0804091C @ =gUnknown_03003100
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	ldr r4, _08040920 @ =gUnknown_030033E4
	ldrh r2, [r4]
	ldrh r3, [r4, #2]
	str r5, [sp]
	bl sub_08042C24
	ldr r0, _08040924 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804090E
	ldr r0, _08040928 @ =gUnknown_03003F38
	ldrb r1, [r0]
	ldrb r2, [r4]
	ldrb r3, [r4, #2]
	movs r0, #0x14
	bl sub_08034534
_0804090E:
	adds r0, r5, #0
	bl Proc_Break
	b _0804095A
	.align 2, 0
_08040918: .4byte gpKeySt
_0804091C: .4byte gUnknown_03003100
_08040920: .4byte gUnknown_030033E4
_08040924: .4byte gUnknown_03003FC0
_08040928: .4byte gUnknown_03003F38
_0804092C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804095A
	ldr r1, _08040964 @ =gUnknown_030033E4
	ldr r2, _08040968 @ =gUnknown_03003100
	ldrh r0, [r2]
	strh r0, [r1]
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl sub_08029088
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	adds r0, r5, #0
	bl Proc_Break
_0804095A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08040964: .4byte gUnknown_030033E4
_08040968: .4byte gUnknown_03003100

