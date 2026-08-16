	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004970
sub_08004970: @ 0x08004970
	push {r4, lr}
	sub sp, #8
	bl sub_08002F1C
	ldr r4, _080049CC @ =gUnknown_03002EE0
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	beq _080049C4
	ldr r0, _080049D0 @ =gUnknown_08499580
	ldr r0, [r0]
	movs r1, #0x11
	str r1, [sp]
	movs r1, #0xd8
	lsls r1, r1, #2
	str r1, [sp, #4]
	movs r1, #9
	movs r2, #2
	movs r3, #0xb
	bl sub_08012BC8
	bl sub_08013B0C
	bl sub_08002E5C
	bl sub_08002E3C
	ldr r0, _080049D4 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	ldr r0, [r4]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080049C4
	ldr r1, _080049D8 @ =gUnknown_03002F1C
	movs r0, #1
	strh r0, [r1]
_080049C4:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080049CC: .4byte gUnknown_03002EE0
_080049D0: .4byte gUnknown_08499580
_080049D4: .4byte gUnknown_03001FBC
_080049D8: .4byte gUnknown_03002F1C

