	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F98C
sub_0801F98C: @ 0x0801F98C
	push {r4, lr}
	movs r1, #0
	ldr r0, _0801F9BC @ =gUnknown_08499590
	ldr r2, [r0]
	ldrh r3, [r2, #2]
	cmp r1, r3
	bge _0801F9B4
	ldrh r4, [r2]
	adds r2, r3, #0
	adds r3, r0, #0
_0801F9A0:
	adds r1, #1
	cmp r4, #0
	beq _0801F9B0
	ldr r0, [r3]
	ldrh r0, [r0]
_0801F9AA:
	subs r0, #1
	cmp r0, #0
	bne _0801F9AA
_0801F9B0:
	cmp r1, r2
	blt _0801F9A0
_0801F9B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F9BC: .4byte gUnknown_08499590

