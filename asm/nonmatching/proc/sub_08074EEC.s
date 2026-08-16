	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074EEC
sub_08074EEC: @ 0x08074EEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08074F14 @ =gUnknown_08614344
	bl Proc_Find
	ldr r1, _08074F18 @ =gUnknown_0861433C
	lsls r4, r4, #1
	adds r4, r4, r1
	adds r3, r0, #0
	adds r3, #0x40
	movs r2, #4
_08074F02:
	ldm r3!, {r1}
	ldrh r0, [r4]
	strh r0, [r1, #0x22]
	subs r2, #1
	cmp r2, #0
	bge _08074F02
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074F14: .4byte gUnknown_08614344
_08074F18: .4byte gUnknown_0861433C

