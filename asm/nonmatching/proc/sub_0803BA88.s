	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803BA88
sub_0803BA88: @ 0x0803BA88
	push {r4, lr}
	movs r0, #1
	bl sub_08016D04
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl sub_08016EA4
	bl sub_08016E74
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	bl sub_08016CD8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BABE
	adds r0, r4, #0
	bl sub_08016E04
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BABE
	adds r0, r4, #0
	bl sub_08017688
	b _0803BACC
_0803BABE:
	ldr r0, _0803BAD4 @ =gUnknown_03003FC0
	movs r1, #1
	strb r1, [r0, #1]
	ldr r0, _0803BAD8 @ =gUnknown_0849EB7C
	movs r1, #3
	bl Proc_Start
_0803BACC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803BAD4: .4byte gUnknown_03003FC0
_0803BAD8: .4byte gUnknown_0849EB7C

