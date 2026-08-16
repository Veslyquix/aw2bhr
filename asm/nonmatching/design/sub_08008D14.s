	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08008D14
sub_08008D14: @ 0x08008D14
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r6, #0
	cmp r4, #0
	ble _08008D28
	subs r1, r4, #1
	bl IsTerrainLand
	lsls r6, r0, #3
_08008D28:
	cmp r5, #0
	ble _08008D38
	subs r0, r5, #1
	adds r1, r4, #0
	bl IsTerrainLand
	lsls r0, r0, #2
	orrs r6, r0
_08008D38:
	ldr r7, _08008D6C @ =gUnknown_08499590
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _08008D50
	adds r0, r5, #1
	adds r1, r4, #0
	bl IsTerrainLand
	lsls r0, r0, #1
	orrs r6, r0
_08008D50:
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r4, r0
	bge _08008D64
	adds r1, r4, #1
	adds r0, r5, #0
	bl IsTerrainLand
	orrs r6, r0
_08008D64:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08008D6C: .4byte gUnknown_08499590

