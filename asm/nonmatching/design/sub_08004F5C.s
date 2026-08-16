	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004F5C
sub_08004F5C: @ 0x08004F5C
	push {r4, lr}
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r4, _08004F94 @ =gUnknown_0200B0B0
	ldr r0, [r4]
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08004F8E
	cmp r2, #2
	beq _08004F8E
	bl sub_0801A168
	ldr r1, [r4]
	movs r0, #2
	strb r0, [r1, #0x10]
	ldr r0, _08004F98 @ =gUnknown_08487E14
	movs r1, #0
	bl sub_080152EC
	ldr r1, [r4]
	movs r0, #7
	strh r0, [r1, #2]
_08004F8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08004F94: .4byte gUnknown_0200B0B0
_08004F98: .4byte gUnknown_08487E14

