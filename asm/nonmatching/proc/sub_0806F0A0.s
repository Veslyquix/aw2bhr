	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806F0A0
sub_0806F0A0: @ 0x0806F0A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806F0E4 @ =gUnknown_08582764
	ldr r1, [r4, #0x30]
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r3, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0806F0CE
	ldrh r0, [r4, #0x34]
	ldr r2, _0806F0E8 @ =gUnknown_0858273C
	movs r1, #0xff
	ands r3, r1
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	bl sub_0806F064
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0806F0CE:
	ldrh r0, [r4, #0x34]
	cmp r0, r3
	beq _0806F0DE
	strh r3, [r4, #0x34]
	ldrh r0, [r4, #0x34]
	adds r1, r4, #0
	bl sub_0806E6C8
_0806F0DE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806F0E4: .4byte gUnknown_08582764
_0806F0E8: .4byte gUnknown_0858273C

