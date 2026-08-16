	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080DFC
sub_08080DFC: @ 0x08080DFC
	push {r4, r5, lr}
	ldr r4, _08080E34 @ =gUnknown_03002020
	ldrh r0, [r4]
	ldr r5, _08080E38 @ =gUnknown_081D9388
	cmp r0, #7
	bhi _08080E24
	ldr r0, [r5]
	ldrh r0, [r0]
	movs r1, #0x40
	bl DivRem
	cmp r0, #0
	bne _08080E24
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r1, _08080E3C @ =gUnknown_03002B28
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08080E24:
	ldr r1, [r5]
	ldrh r0, [r1]
	adds r0, #0x18
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080E34: .4byte gUnknown_03002020
_08080E38: .4byte gUnknown_081D9388
_08080E3C: .4byte gUnknown_03002B28

