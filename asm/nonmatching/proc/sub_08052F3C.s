	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08052F3C
sub_08052F3C: @ 0x08052F3C
	push {r4, r5, r6, lr}
	movs r1, #0
	ldr r6, _08052F74 @ =gUnknown_03004550
	ldr r5, _08052F78 @ =gUnknown_08551A08
_08052F44:
	lsls r0, r1, #4
	adds r4, r1, #1
	adds r2, r0, r5
	adds r1, r0, r6
	movs r3, #7
_08052F4E:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bge _08052F4E
	adds r1, r4, #0
	cmp r1, #1
	ble _08052F44
	movs r0, #0
	ldr r1, _08052F7C @ =gUnknown_030045AC
	strh r0, [r1]
	ldr r1, _08052F80 @ =gUnknown_03004540
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08052F74: .4byte gUnknown_03004550
_08052F78: .4byte gUnknown_08551A08
_08052F7C: .4byte gUnknown_030045AC
_08052F80: .4byte gUnknown_03004540

