	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041DF8
sub_08041DF8: @ 0x08041DF8
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0802C57C
	bl sub_080424FC
	bl sub_0802C594
	adds r4, #0x64
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _08041E34
	ldr r0, _08041E3C @ =gUnknown_03003F40
	ldr r0, [r0]
	bl sub_080413A4
	adds r2, r0, #0
	ldr r0, _08041E40 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08041E34
	ldr r0, _08041E44 @ =gUnknown_03003F38
	ldrb r1, [r0]
	ldrb r2, [r2]
	movs r0, #4
	movs r3, #0
	bl sub_08034534
_08041E34:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041E3C: .4byte gUnknown_03003F40
_08041E40: .4byte gUnknown_03003FC0
_08041E44: .4byte gUnknown_03003F38

