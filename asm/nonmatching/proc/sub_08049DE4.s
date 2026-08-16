	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049DE4
sub_08049DE4: @ 0x08049DE4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0x1e
	ldrsh r0, [r5, r1]
	cmp r0, #0xa
	beq _08049DF6
	cmp r0, #0x32
	beq _08049E20
	b _08049E28
_08049DF6:
	ldr r4, _08049E1C @ =gUnknown_084C3244
	adds r0, r4, #0
	movs r1, #0
	bl sub_080152EC
	adds r0, r4, #0
	movs r1, #0
	bl sub_080152EC
	adds r0, r4, #0
	movs r1, #0
	bl sub_080152EC
	adds r0, r4, #0
	movs r1, #0
	bl sub_080152EC
	b _08049E28
	.align 2, 0
_08049E1C: .4byte gUnknown_084C3244
_08049E20:
	ldr r0, _08049E34 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_08049E28:
	ldrh r0, [r5, #0x1e]
	adds r0, #1
	strh r0, [r5, #0x1e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049E34: .4byte gUnknown_03001FBC

