	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080330C0
sub_080330C0: @ 0x080330C0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x71
	bl sub_0803B4DC
	bl sub_0803BD6C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08033110
	bl sub_08032D60
	ldr r0, _080330FC @ =gUnknown_0849B688
	bl Proc_EndEach
	ldr r0, _08033100 @ =gUnknown_0849B670
	bl Proc_EndEach
	ldr r0, _08033104 @ =gUnknown_0849B060
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r2, #0
	strb r1, [r0, #8]
	ldr r1, _08033108 @ =gUnknown_03003F1C
	ldr r0, _0803310C @ =gUnknown_030044C4
	strb r2, [r0]
	ldrb r0, [r0]
	strb r0, [r1]
	b _08033118
	.align 2, 0
_080330FC: .4byte gUnknown_0849B688
_08033100: .4byte gUnknown_0849B670
_08033104: .4byte gUnknown_0849B060
_08033108: .4byte gUnknown_03003F1C
_0803310C: .4byte gUnknown_030044C4
_08033110:
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
_08033118:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

