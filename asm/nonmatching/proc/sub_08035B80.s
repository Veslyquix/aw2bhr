	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035B80
sub_08035B80: @ 0x08035B80
	push {r4, lr}
	ldr r0, _08035BB8 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r1, _08035BBC @ =gUnknown_03001470
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #5
	adds r2, r2, r1
	ldr r1, _08035BC0 @ =gUnknown_08499590
	ldr r4, [r1]
	ldrh r1, [r2, #0x1e]
	ldrh r3, [r4, #4]
	subs r1, r1, r3
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r2, #0x20]
	ldrh r3, [r4, #6]
	subs r2, r2, r3
	subs r2, #2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl sub_080155C0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035BB8: .4byte gUnknown_03001FBC
_08035BBC: .4byte gUnknown_03001470
_08035BC0: .4byte gUnknown_08499590

