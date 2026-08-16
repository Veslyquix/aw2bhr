	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803CDBC
sub_0803CDBC: @ 0x0803CDBC
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	ldr r5, _0803CE14 @ =gUnknown_02000000
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r2, r2, r0
	lsrs r4, r2, #0x18
	adds r0, r4, #0
	bl sub_0801AD70
	cmp r0, #0
	bne _0803CE1C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0801AC58
	adds r0, r5, #0
	bl sub_08037B84
	adds r0, r5, #0
	bl sub_0803D6FC
	ldr r0, _0803CE18 @ =gUnknown_03002B6C
	ldr r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	str r6, [sp]
	movs r1, #5
	str r1, [sp, #4]
	movs r1, #1
	movs r2, #0
	adds r3, r7, #0
	bl sub_080376DC
	movs r0, #1
	b _0803CE1E
	.align 2, 0
_0803CE14: .4byte gUnknown_02000000
_0803CE18: .4byte gUnknown_03002B6C
_0803CE1C:
	movs r0, #0
_0803CE1E:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

