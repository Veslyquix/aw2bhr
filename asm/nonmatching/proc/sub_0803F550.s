	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803F550
sub_0803F550: @ 0x0803F550
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0803F5AC @ =gUnknown_08117380
	ldr r5, _0803F5B0 @ =gUnknown_0200FC50
	adds r1, r5, #0
	bl sub_08011CAC
	ldr r0, _0803F5B4 @ =gUnknown_081190D8
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x40
	bl sub_08013618
	ldr r1, [r4, #0x2c]
	lsls r1, r1, #4
	ldr r0, _0803F5B8 @ =gUnknown_08499590
	ldr r3, [r0]
	movs r2, #4
	ldrsh r0, [r3, r2]
	subs r1, r1, r0
	ldr r2, [r4, #0x30]
	lsls r2, r2, #4
	movs r4, #6
	ldrsh r0, [r3, r4]
	subs r2, r2, r0
	ldr r0, _0803F5BC @ =gUnknown_081183EC
	adds r1, #0x18
	ldr r3, _0803F5C0 @ =0x000001FF
	ands r1, r3
	adds r2, #0x4e
	movs r3, #0xff
	ands r2, r3
	ldr r3, _0803F5C4 @ =0x000031CA
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	bl sub_0801C70C
	ldr r0, [r0, #0x50]
	str r5, [r0, #0x24]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803F5AC: .4byte gUnknown_08117380
_0803F5B0: .4byte gUnknown_0200FC50
_0803F5B4: .4byte gUnknown_081190D8
_0803F5B8: .4byte gUnknown_08499590
_0803F5BC: .4byte gUnknown_081183EC
_0803F5C0: .4byte 0x000001FF
_0803F5C4: .4byte 0x000031CA

