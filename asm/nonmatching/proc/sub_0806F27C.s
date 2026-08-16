	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806F27C
sub_0806F27C: @ 0x0806F27C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_080733B8
	ldr r0, _0806F2B4 @ =gUnknown_08582B2C
	bl Proc_EndEach
	ldr r0, _0806F2B8 @ =gUnknown_08582C24
	bl Proc_EndEach
	adds r5, r4, #0
	adds r5, #0x3c
	movs r4, #5
_0806F296:
	ldm r5!, {r0}
	bl Proc_End
	subs r4, #1
	cmp r4, #0
	bge _0806F296
	ldr r0, _0806F2BC @ =gUnknown_08582BE4
	bl Proc_EndEach
	bl sub_08074028
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F2B4: .4byte gUnknown_08582B2C
_0806F2B8: .4byte gUnknown_08582C24
_0806F2BC: .4byte gUnknown_08582BE4

