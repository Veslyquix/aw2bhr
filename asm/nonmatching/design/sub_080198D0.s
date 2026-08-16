	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080198D0
sub_080198D0: @ 0x080198D0
	push {lr}
	ldr r0, _08019904 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _08019908 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _080198FE
	ldr r0, _0801990C @ =gUnknown_03001FF0
	ldr r0, [r0]
	cmp r0, #0
	beq _080198FE
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080198FE
	bl sub_08034F7C
_080198FE:
	pop {r0}
	bx r0
	.align 2, 0
_08019904: .4byte gUnknown_030033EC
_08019908: .4byte gUnknown_08499598
_0801990C: .4byte gUnknown_03001FF0

