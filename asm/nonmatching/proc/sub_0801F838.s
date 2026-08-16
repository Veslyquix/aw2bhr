	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F838
sub_0801F838: @ 0x0801F838
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r2, #0
	ldr r1, _0801F880 @ =gUnknown_08499590
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r2, r0
	bge _0801F87A
	adds r6, r1, #0
	ldr r7, _0801F884 @ =gUnknown_03003340
_0801F84E:
	movs r1, #0
	ldr r0, [r6]
	adds r4, r2, #1
	ldrh r0, [r0]
	cmp r1, r0
	bge _0801F870
	lsls r0, r2, #2
	adds r2, r0, r7
	ldr r3, _0801F880 @ =gUnknown_08499590
_0801F860:
	ldr r0, [r2]
	adds r0, r0, r1
	strb r5, [r0]
	adds r1, #1
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r1, r0
	blt _0801F860
_0801F870:
	adds r2, r4, #0
	ldr r0, [r6]
	ldrh r0, [r0, #2]
	cmp r2, r0
	blt _0801F84E
_0801F87A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801F880: .4byte gUnknown_08499590
_0801F884: .4byte gUnknown_03003340

