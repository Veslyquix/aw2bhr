	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08042D84
sub_08042D84: @ 0x08042D84
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl sub_080433E8
	adds r5, r0, #0
	ldr r0, _08042DBC @ =gUnknown_08499598
	ldr r0, [r0]
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r0, [r1, #0x1d]
	ldrb r1, [r1, #0x1e]
	bl sub_080432A8
	adds r5, r5, r0
	ldr r0, _08042DC0 @ =gUnknown_03003FC0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #2
	bne _08042DB2
	subs r5, #1
_08042DB2:
	cmp r5, #1
	bgt _08042DC4
	movs r0, #1
	b _08042DC6
	.align 2, 0
_08042DBC: .4byte gUnknown_08499598
_08042DC0: .4byte gUnknown_03003FC0
_08042DC4:
	adds r0, r5, #0
_08042DC6:
	pop {r4, r5}
	pop {r1}
	bx r1

