	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019910
sub_08019910: @ 0x08019910
	ldr r1, _08019928 @ =gUnknown_03003110
	movs r2, #1
	rsbs r2, r2, #0
_08019916:
	ldrb r0, [r1]
	adds r1, #1
	cmp r0, #4
	beq _08019934
	cmp r0, #4
	bgt _0801992C
	cmp r0, r2
	beq _08019934
	b _08019916
	.align 2, 0
_08019928: .4byte gUnknown_03003110
_0801992C:
	cmp r0, #0xa
	bne _08019916
	movs r0, #1
	b _08019936
_08019934:
	movs r0, #0
_08019936:
	bx lr

