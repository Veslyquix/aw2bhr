	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08008CB8
sub_08008CB8: @ 0x08008CB8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r6, #0
	cmp r4, #0
	ble _08008CCC
	subs r1, r4, #1
	bl sub_0800977C
	lsls r6, r0, #3
_08008CCC:
	cmp r5, #0
	ble _08008CDC
	subs r0, r5, #1
	adds r1, r4, #0
	bl sub_0800977C
	lsls r0, r0, #2
	orrs r6, r0
_08008CDC:
	ldr r7, _08008D10 @ =gUnknown_08499590
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _08008CF4
	adds r0, r5, #1
	adds r1, r4, #0
	bl sub_0800977C
	lsls r0, r0, #1
	orrs r6, r0
_08008CF4:
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r4, r0
	bge _08008D08
	adds r1, r4, #1
	adds r0, r5, #0
	bl sub_0800977C
	orrs r6, r0
_08008D08:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08008D10: .4byte gUnknown_08499590

