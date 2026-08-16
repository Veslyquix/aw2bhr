	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800F3B8
sub_0800F3B8: @ 0x0800F3B8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r6, #0
	cmp r4, #0
	ble _0800F3CC
	subs r1, r4, #1
	bl sub_0800F368
	lsls r6, r0, #7
_0800F3CC:
	cmp r5, #0
	ble _0800F3DC
	subs r0, r5, #1
	adds r1, r4, #0
	bl sub_0800F318
	lsls r0, r0, #5
	orrs r6, r0
_0800F3DC:
	ldr r7, _0800F414 @ =gUnknown_08499590
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _0800F3F4
	adds r0, r5, #1
	adds r1, r4, #0
	bl sub_0800F318
	lsls r0, r0, #3
	orrs r6, r0
_0800F3F4:
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r4, r0
	bge _0800F40A
	adds r1, r4, #1
	adds r0, r5, #0
	bl sub_0800F368
	lsls r0, r0, #1
	orrs r6, r0
_0800F40A:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800F414: .4byte gUnknown_08499590

