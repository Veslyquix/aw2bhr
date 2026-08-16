	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800B5C0
sub_0800B5C0: @ 0x0800B5C0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r6, #0
	cmp r4, #0
	ble _0800B5D4
	subs r1, r4, #1
	bl sub_0800B4F0
	lsls r6, r0, #3
_0800B5D4:
	cmp r5, #0
	ble _0800B5E4
	subs r0, r5, #1
	adds r1, r4, #0
	bl sub_0800B4F0
	lsls r0, r0, #2
	orrs r6, r0
_0800B5E4:
	ldr r7, _0800B618 @ =gUnknown_08499590
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _0800B5FC
	adds r0, r5, #1
	adds r1, r4, #0
	bl sub_0800B4F0
	lsls r0, r0, #1
	orrs r6, r0
_0800B5FC:
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r4, r0
	bge _0800B610
	adds r1, r4, #1
	adds r0, r5, #0
	bl sub_0800B4F0
	orrs r6, r0
_0800B610:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800B618: .4byte gUnknown_08499590

