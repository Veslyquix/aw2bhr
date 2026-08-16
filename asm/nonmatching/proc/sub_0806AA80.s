	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806AA80
sub_0806AA80: @ 0x0806AA80
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0xc5
	bl sub_0803B4DC
	ldr r0, _0806AABC @ =gUnknown_0858168C
	movs r1, #3
	bl Proc_Start
	lsls r4, r4, #4
	ldr r1, _0806AAC0 @ =gUnknown_08499590
	ldr r2, [r1]
	movs r3, #4
	ldrsh r1, [r2, r3]
	subs r1, #8
	subs r4, r4, r1
	lsls r5, r5, #4
	movs r3, #6
	ldrsh r1, [r2, r3]
	subs r1, #8
	subs r5, r5, r1
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_0806A6F0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AABC: .4byte gUnknown_0858168C
_0806AAC0: .4byte gUnknown_08499590

