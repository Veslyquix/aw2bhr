	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087C14
sub_08087C14: @ 0x08087C14
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _08087C68 @ =gUnknown_08616DB4
	bl Proc_Find
	cmp r0, #0
	beq _08087C62
	str r5, [r0, #0x54]
	movs r4, #0
	ldr r7, _08087C6C @ =gUnknown_0200C078
	ldr r0, _08087C70 @ =gUnknown_02027F78
	adds r6, r5, r0
	movs r5, #0xb4
_08087C2E:
	ldrb r0, [r6]
	subs r0, #0x6c
	lsls r1, r0, #2
	adds r1, r1, r0
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r7
	ldr r0, [r1]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x14
	cmp r0, #0
	beq _08087C5A
	ldrb r0, [r1]
	ldr r1, _08087C74 @ =0x000003FF
	ands r1, r5
	lsls r1, r1, #5
	ldr r2, _08087C78 @ =0x06010000
	adds r1, r1, r2
	adds r2, r4, #0
	adds r2, #0x1a
	bl sub_08043FA8
_08087C5A:
	adds r5, #0xc
	adds r4, #1
	cmp r4, #4
	ble _08087C2E
_08087C62:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087C68: .4byte gUnknown_08616DB4
_08087C6C: .4byte gUnknown_0200C078
_08087C70: .4byte gUnknown_02027F78
_08087C74: .4byte 0x000003FF
_08087C78: .4byte 0x06010000

