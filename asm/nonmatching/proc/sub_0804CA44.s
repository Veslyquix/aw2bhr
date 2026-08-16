	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804CA44
sub_0804CA44: @ 0x0804CA44
	push {r4, r5, r6, lr}
	ldr r3, _0804CA90 @ =gUnknown_03001470
	ldr r6, _0804CA94 @ =gUnknown_03001FBC
	movs r0, #0
	ldrsh r2, [r6, r0]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #5
	adds r0, r3, #0
	adds r0, #0x30
	adds r0, r1, r0
	ldrh r5, [r0]
	adds r3, #0x34
	adds r1, r1, r3
	ldrh r4, [r1]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0804CA98
	movs r0, #0
	ldrsh r2, [r6, r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0804BECC
	movs r0, #0
	ldrsh r2, [r6, r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0804DC5C
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08056E9C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804CA90: .4byte gUnknown_03001470
_0804CA94: .4byte gUnknown_03001FBC

