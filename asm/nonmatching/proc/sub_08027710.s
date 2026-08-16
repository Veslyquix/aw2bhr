	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027710
sub_08027710: @ 0x08027710
	push {r4, lr}
	ldr r3, _08027744 @ =gUnknown_030033E4
	ldrh r0, [r3]
	lsls r0, r0, #4
	ldr r1, _08027748 @ =gUnknown_08499590
	ldr r2, [r1]
	ldrh r1, [r2, #4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrh r0, [r3, #2]
	lsls r0, r0, #4
	ldrh r1, [r2, #6]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _0802774C
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7f
	bgt _08027754
	bl sub_080276F0
	b _08027764
	.align 2, 0
_08027744: .4byte gUnknown_030033E4
_08027748: .4byte gUnknown_08499590
_0802774C:
	ldr r0, _0802775C @ =gUnknown_03003130
	ldrb r0, [r0]
	cmp r0, #0
	bne _08027760
_08027754:
	bl sub_080276D0
	b _08027764
	.align 2, 0
_0802775C: .4byte gUnknown_03003130
_08027760:
	bl sub_080276F0
_08027764:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

