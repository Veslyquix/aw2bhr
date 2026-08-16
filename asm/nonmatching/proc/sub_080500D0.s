	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080500D0
sub_080500D0: @ 0x080500D0
	push {r4, r5, lr}
	ldr r2, _0805011C @ =gUnknown_03001470
	ldr r0, _08050120 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r2, #0x30
	adds r1, r1, r2
	ldrh r3, [r1]
	ldr r1, _08050124 @ =gUnknown_084C3F70
	lsls r2, r3, #2
	adds r1, r2, r1
	ldr r4, [r1]
	ldr r1, _08050128 @ =gUnknown_084C3F78
	adds r2, r2, r1
	ldr r5, [r2]
	ldr r1, _0805012C @ =gUnknown_02029C0C
	lsls r3, r3, #1
	adds r1, r3, r1
	ldrh r1, [r1]
	ldrh r2, [r4]
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r2, _08050130 @ =gUnknown_02029C10
	adds r3, r3, r2
	ldrh r2, [r3]
	ldrh r3, [r5]
	subs r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_080155C0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805011C: .4byte gUnknown_03001470
_08050120: .4byte gUnknown_03001FBC
_08050124: .4byte gUnknown_084C3F70
_08050128: .4byte gUnknown_084C3F78
_0805012C: .4byte gUnknown_02029C0C
_08050130: .4byte gUnknown_02029C10

