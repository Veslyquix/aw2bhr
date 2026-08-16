	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027FF4
sub_08027FF4: @ 0x08027FF4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	ldr r0, _0802810C @ =gUnknown_08090ABC
	mov r8, r0
	ldr r0, [r0]
	ldrh r7, [r0]
	movs r6, #6
	ldr r0, _08028110 @ =gUnknown_08125A8C
	ldr r5, _08028114 @ =gUnknown_08090AC0
	ldr r4, [r5]
	adds r1, r4, #0
	bl sub_08011CAC
	bl sub_0801F48C
	movs r1, #0xa0
	lsls r1, r1, #5
	adds r4, r4, r1
	adds r1, r4, #0
	bl sub_08011CAC
_08028026:
	adds r0, r7, #0
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [r5]
	adds r2, r6, #0
	bl sub_08027FBC
	subs r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r7, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	bne _08028026
	ldr r4, [r5]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0
	bl sub_08027FBC
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #1
	bl sub_08027FBC
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #2
	bl sub_08027FBC
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #3
	bl sub_08027FBC
	ldr r0, _08028118 @ =gUnknown_081268B8
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _0802811C @ =gUnknown_080A1178
	ldr r1, _08028120 @ =0x060045E0
	movs r2, #0xc0
	bl sub_08011E54
	ldr r3, _08028124 @ =gUnknown_080A1238
	ldr r0, _08028128 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _0802812C @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
	subs r0, #1
	lsls r0, r0, #5
	adds r0, r0, r3
	movs r1, #0x90
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _08028130 @ =gUnknown_08499578
	ldr r0, [r0]
	ldr r1, _08028134 @ =gUnknown_080A12B8
	ldr r2, _08028138 @ =0x0000922F
	str r2, [sp]
	movs r2, #0
	movs r3, #7
	bl sub_08012B70
	bl sub_08013AEC
	bl sub_08024378
	movs r4, #1
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0]
	cmp r0, #9
	bls _080280DE
	movs r4, #2
_080280DE:
	cmp r0, #0x63
	bls _080280E4
	movs r4, #3
_080280E4:
	bl sub_0802813C
	adds r0, r0, r4
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	movs r0, #0x80
	lsls r0, r0, #1
	subs r0, r0, r1
	asrs r0, r0, #1
	mov r1, sb
	strh r0, [r1, #0x20]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802810C: .4byte gUnknown_08090ABC
_08028110: .4byte gUnknown_08125A8C
_08028114: .4byte gUnknown_08090AC0
_08028118: .4byte gUnknown_081268B8
_0802811C: .4byte gUnknown_080A1178
_08028120: .4byte 0x060045E0
_08028124: .4byte gUnknown_080A1238
_08028128: .4byte gUnknown_030033EC
_0802812C: .4byte gUnknown_08499598
_08028130: .4byte gUnknown_08499578
_08028134: .4byte gUnknown_080A12B8
_08028138: .4byte 0x0000922F

