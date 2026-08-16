	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F2F4
sub_0803F2F4: @ 0x0803F2F4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0803F358 @ =gUnknown_08115A78
	ldr r5, _0803F35C @ =gUnknown_0200FC50
	adds r1, r5, #0
	bl sub_08011CAC
	ldr r0, _0803F360 @ =gUnknown_081169B0
	movs r1, #0xa8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	movs r0, #0xec
	lsls r0, r0, #1
	bl sub_0803B4DC
	ldr r0, _0803F364 @ =gUnknown_081161CC
	ldr r1, [r4, #0x2c]
	lsls r1, r1, #4
	ldr r2, _0803F368 @ =gUnknown_08499590
	ldr r3, [r2]
	movs r6, #4
	ldrsh r2, [r3, r6]
	subs r1, r1, r2
	adds r1, #0x20
	ldr r2, _0803F36C @ =0x000001FF
	ands r1, r2
	ldr r2, [r4, #0x30]
	lsls r2, r2, #4
	movs r4, #6
	ldrsh r3, [r3, r4]
	subs r2, r2, r3
	adds r2, #8
	movs r3, #0xff
	ands r2, r3
	ldr r3, _0803F370 @ =0x000051CA
	movs r4, #0
	str r4, [sp]
	movs r4, #1
	str r4, [sp, #4]
	bl sub_0801C70C
	ldr r0, [r0, #0x50]
	str r5, [r0, #0x24]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803F358: .4byte gUnknown_08115A78
_0803F35C: .4byte gUnknown_0200FC50
_0803F360: .4byte gUnknown_081169B0
_0803F364: .4byte gUnknown_081161CC
_0803F368: .4byte gUnknown_08499590
_0803F36C: .4byte 0x000001FF
_0803F370: .4byte 0x000051CA

