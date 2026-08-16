	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080860DC
sub_080860DC: @ 0x080860DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r0, #0x4e
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _080860FC
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	cmp r0, #0
	beq _0808610A
_080860FC:
	adds r0, r5, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #7
	bgt _0808610A
	b _08086674
_0808610A:
	ldr r0, [r5, #0x2c]
	cmp r0, #0x10
	bgt _08086112
	b _08086674
_08086112:
	ldr r1, _08086158 @ =gUnknown_081D9410
	ldr r0, [r1]
	ldr r3, [r0]
	ldrh r2, [r3, #2]
	movs r0, #0x40
	ands r0, r2
	adds r6, r1, #0
	cmp r0, #0
	beq _08086204
	ldr r0, _0808615C @ =gUnknown_02027F74
	adds r0, #0x36
	ldr r1, [r5, #0x58]
	ldrb r0, [r0]
	cmp r1, r0
	bgt _08086132
	b _08086674
_08086132:
	subs r1, #1
	str r1, [r5, #0x58]
	ldr r0, _08086160 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _0808617C
	adds r0, r1, #0
	bl sub_08087B60
	ldr r2, _08086164 @ =gUnknown_03005930
	ldrh r1, [r2]
	cmp r1, #1
	bhi _08086152
	ldr r0, [r5, #0x5c]
	cmp r0, #0
	bne _08086168
_08086152:
	subs r0, r1, #1
	strh r0, [r2]
	b _08086170
	.align 2, 0
_08086158: .4byte gUnknown_081D9410
_0808615C: .4byte gUnknown_02027F74
_08086160: .4byte gUnknown_03003FC0
_08086164: .4byte gUnknown_03005930
_08086168:
	subs r0, #1
	str r0, [r5, #0x5c]
	movs r0, #1
	str r0, [r5, #0x30]
_08086170:
	ldr r1, _08086178 @ =gUnknown_03005900
	ldr r0, [r5, #0x5c]
	strb r0, [r1]
	b _080861AA
	.align 2, 0
_08086178: .4byte gUnknown_03005900
_0808617C:
	ldr r2, _08086190 @ =gUnknown_03005980
	ldrh r1, [r2]
	cmp r1, #1
	bhi _0808618A
	ldr r0, [r5, #0x5c]
	cmp r0, #0
	bne _08086194
_0808618A:
	subs r0, r1, #1
	strh r0, [r2]
	b _0808619C
	.align 2, 0
_08086190: .4byte gUnknown_03005980
_08086194:
	subs r0, #1
	str r0, [r5, #0x5c]
	movs r0, #1
	str r0, [r5, #0x30]
_0808619C:
	ldr r1, _080861E8 @ =gUnknown_03005990
	ldr r0, _080861EC @ =gUnknown_0300596C
	movs r6, #0
	ldrsh r0, [r0, r6]
	adds r0, r0, r1
	ldr r1, [r5, #0x5c]
	strb r1, [r0]
_080861AA:
	adds r1, r5, #0
	adds r1, #0x4e
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r7, r1, #0
	adds r6, r5, #0
	adds r6, #0x52
	cmp r0, #0
	bne _080861C2
	ldrh r1, [r6]
	cmp r1, #0
	beq _080861F4
_080861C2:
	bl sub_08013C54
	bl sub_08013AFC
	ldr r4, _080861F0 @ =gUnknown_03002F18
	bl sub_08087298
	movs r2, #0
	ldrsh r1, [r7, r2]
	lsls r1, r1, #8
	adds r0, r0, r1
	strh r0, [r4]
	adds r1, r5, #0
	adds r1, #0x4c
	movs r2, #0
	movs r0, #8
	strh r0, [r1]
	strh r2, [r6]
	b _080861FA
	.align 2, 0
_080861E8: .4byte gUnknown_03005990
_080861EC: .4byte gUnknown_0300596C
_080861F0: .4byte gUnknown_03002F18
_080861F4:
	adds r0, r5, #0
	adds r0, #0x4c
	strh r1, [r0]
_080861FA:
	ldr r0, _08086200 @ =0x0000FFFF
	b _08086304
	.align 2, 0
_08086200: .4byte 0x0000FFFF
_08086204:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _0808620E
	b _08086324
_0808620E:
	ldr r0, _08086250 @ =gUnknown_02027F74
	adds r4, r0, #0
	adds r4, #0x37
	ldr r0, [r5, #0x58]
	ldrb r6, [r4]
	cmp r0, r6
	blt _0808621E
	b _08086674
_0808621E:
	adds r1, r0, #1
	str r1, [r5, #0x58]
	ldr r0, _08086254 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _08086274
	adds r0, r1, #0
	bl sub_08087B60
	ldr r3, _08086258 @ =gUnknown_03005930
	ldrh r2, [r3]
	ldr r0, _0808625C @ =gUnknown_03005928
	ldr r1, [r0]
	subs r0, r1, #2
	cmp r2, r0
	blt _0808624A
	ldrb r0, [r4]
	subs r0, r0, r1
	adds r0, #1
	ldr r1, [r5, #0x5c]
	cmp r1, r0
	bne _08086260
_0808624A:
	adds r0, r2, #1
	strh r0, [r3]
	b _08086268
	.align 2, 0
_08086250: .4byte gUnknown_02027F74
_08086254: .4byte gUnknown_03003FC0
_08086258: .4byte gUnknown_03005930
_0808625C: .4byte gUnknown_03005928
_08086260:
	adds r0, r1, #1
	str r0, [r5, #0x5c]
	movs r0, #1
	str r0, [r5, #0x30]
_08086268:
	ldr r1, _08086270 @ =gUnknown_03005900
	ldr r0, [r5, #0x5c]
	strb r0, [r1]
	b _080862B2
	.align 2, 0
_08086270: .4byte gUnknown_03005900
_08086274:
	ldr r3, _08086294 @ =gUnknown_03005980
	ldrh r2, [r3]
	ldr r0, _08086298 @ =gUnknown_03005928
	ldr r1, [r0]
	subs r0, r1, #2
	cmp r2, r0
	blt _0808628E
	ldrb r0, [r4]
	subs r0, r0, r1
	adds r0, #1
	ldr r1, [r5, #0x5c]
	cmp r1, r0
	bne _0808629C
_0808628E:
	adds r0, r2, #1
	strh r0, [r3]
	b _080862A4
	.align 2, 0
_08086294: .4byte gUnknown_03005980
_08086298: .4byte gUnknown_03005928
_0808629C:
	adds r0, r1, #1
	str r0, [r5, #0x5c]
	movs r0, #1
	str r0, [r5, #0x30]
_080862A4:
	ldr r1, _080862F0 @ =gUnknown_03005990
	ldr r0, _080862F4 @ =gUnknown_0300596C
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldr r1, [r5, #0x5c]
	strb r1, [r0]
_080862B2:
	adds r1, r5, #0
	adds r1, #0x4e
	movs r6, #0
	ldrsh r0, [r1, r6]
	adds r7, r1, #0
	adds r6, r5, #0
	adds r6, #0x52
	cmp r0, #0
	bne _080862CA
	ldrh r1, [r6]
	cmp r1, #0
	beq _080862FC
_080862CA:
	bl sub_08013C54
	bl sub_08013AFC
	ldr r4, _080862F8 @ =gUnknown_03002F18
	bl sub_08087298
	movs r2, #0
	ldrsh r1, [r7, r2]
	lsls r1, r1, #8
	adds r0, r0, r1
	strh r0, [r4]
	adds r1, r5, #0
	adds r1, #0x4c
	movs r2, #0
	movs r0, #8
	strh r0, [r1]
	strh r2, [r6]
	b _08086302
	.align 2, 0
_080862F0: .4byte gUnknown_03005990
_080862F4: .4byte gUnknown_0300596C
_080862F8: .4byte gUnknown_03002F18
_080862FC:
	adds r0, r5, #0
	adds r0, #0x4c
	strh r1, [r0]
_08086302:
	movs r0, #1
_08086304:
	strh r0, [r7]
	ldr r2, _08086320 @ =gUnknown_03001FE8
	ldrb r1, [r2, #1]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #1]
	bl sub_080876B4
	movs r0, #0x67
	bl sub_0803B4DC
	b _08086674
	.align 2, 0
_08086320: .4byte gUnknown_03001FE8
_08086324:
	ldrh r1, [r3, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080863CC
	adds r1, r5, #0
	adds r1, #0x4e
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r7, r1, #0
	cmp r0, #0
	bne _080863CC
	ldr r0, _08086370 @ =gUnknown_084892C4
	bl Proc_Find
	cmp r0, #0
	bne _080863CC
	ldr r4, _08086374 @ =gUnknown_081D9414
	ldr r1, [r4]
	adds r1, #4
	ldr r0, [r5, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_0803CA54
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808635E
	b _08086674
_0808635E:
	ldr r0, _08086378 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _08086380
	ldr r1, _0808637C @ =gUnknown_03005900
	ldr r0, [r5, #0x5c]
	strb r0, [r1]
	b _0808638E
	.align 2, 0
_08086370: .4byte gUnknown_084892C4
_08086374: .4byte gUnknown_081D9414
_08086378: .4byte gUnknown_03003FC0
_0808637C: .4byte gUnknown_03005900
_08086380:
	ldr r1, _080863BC @ =gUnknown_03005990
	ldr r0, _080863C0 @ =gUnknown_0300596C
	movs r6, #0
	ldrsh r0, [r0, r6]
	adds r0, r0, r1
	ldr r1, [r5, #0x5c]
	strb r1, [r0]
_0808638E:
	ldr r1, _080863C4 @ =gUnknown_02027F74
	adds r1, #4
	ldr r0, [r5, #0x58]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl sub_0803BCD0
	bl sub_0803BD54
	movs r0, #0x71
	bl sub_0803B4DC
	bl sub_08037780
	ldr r0, _080863C8 @ =gUnknown_08616CCC
	adds r1, r5, #0
	bl Proc_Start
	movs r0, #1
	strh r0, [r7]
	adds r1, r5, #0
	adds r1, #0x4c
	b _08086410
	.align 2, 0
_080863BC: .4byte gUnknown_03005990
_080863C0: .4byte gUnknown_0300596C
_080863C4: .4byte gUnknown_02027F74
_080863C8: .4byte gUnknown_08616CCC
_080863CC:
	ldr r0, [r6]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08086424
	ldr r0, _0808641C @ =gUnknown_084892C4
	bl Proc_Find
	cmp r0, #0
	bne _08086424
	ldr r4, _08086420 @ =gUnknown_08616CCC
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	bne _08086424
	movs r0, #0x66
	bl sub_0803B4DC
	bl sub_0803BD60
	bl sub_08037780
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_Start
	adds r1, r5, #0
	adds r1, #0x4e
	movs r0, #1
	strh r0, [r1]
	subs r1, #2
_08086410:
	movs r0, #0x1e
	strh r0, [r1]
	adds r0, r5, #0
	bl Proc_Break
	b _08086674
	.align 2, 0
_0808641C: .4byte gUnknown_084892C4
_08086420: .4byte gUnknown_08616CCC
_08086424:
	ldr r0, _08086458 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _08086470
	ldr r0, [r6]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0808643E
	b _08086674
_0808643E:
	ldr r2, _0808645C @ =gUnknown_0200C420
	ldrb r1, [r2, #0xc]
	movs r0, #1
	subs r0, r0, r1
	strb r0, [r2, #0xc]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08086460
	movs r0, #0x65
	bl sub_0803B4DC
	b _08086466
	.align 2, 0
_08086458: .4byte gUnknown_03003FC0
_0808645C: .4byte gUnknown_0200C420
_08086460:
	movs r0, #0x66
	bl sub_0803B4DC
_08086466:
	ldr r0, [r5, #0x58]
	adds r1, r5, #0
	bl sub_08087974
	b _08086674
_08086470:
	ldr r0, [r6]
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x88
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08086482
	b _0808657C
_08086482:
	ldr r3, _080864BC @ =gUnknown_081D941C
	ldr r1, [r3]
	ldr r2, _080864C0 @ =gUnknown_081D9420
	ldr r4, [r2]
	movs r6, #0
	ldrsh r0, [r4, r6]
	adds r0, r0, r1
	ldr r1, [r5, #0x5c]
	strb r1, [r0]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r2
	cmp r0, #1
	bgt _080864A8
	movs r0, #8
	strh r0, [r4]
_080864A8:
	adds r7, r5, #0
	adds r7, #0x4e
	adds r6, r5, #0
	adds r6, #0x52
	movs r0, #0x4c
	adds r0, r0, r5
	mov r8, r0
	ldr r1, _080864C4 @ =gUnknown_081D9418
	mov sb, r1
	b _080864DA
	.align 2, 0
_080864BC: .4byte gUnknown_081D941C
_080864C0: .4byte gUnknown_081D9420
_080864C4: .4byte gUnknown_081D9418
_080864C8:
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bgt _080864DA
	movs r0, #8
	strh r0, [r4]
_080864DA:
	mov r2, sl
	ldr r4, [r2]
	ldrb r0, [r4]
	bl sub_08037448
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080864C8
	ldr r1, _08086540 @ =gUnknown_03005990
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	ldrb r3, [r0]
	str r3, [r5, #0x5c]
	mov r0, sb
	ldr r2, [r0]
	ldr r0, _08086544 @ =gUnknown_02027F74
	adds r0, #0x37
	ldrb r1, [r0]
	ldrh r0, [r2]
	cmp r0, r1
	bls _08086508
	strh r1, [r2]
_08086508:
	ldrh r0, [r2]
	adds r0, r3, r0
	str r0, [r5, #0x58]
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #0
	bne _0808651C
	ldrh r0, [r6]
	cmp r0, #0
	beq _0808654C
_0808651C:
	bl sub_08013C54
	bl sub_08013AFC
	ldr r4, _08086548 @ =gUnknown_03002B34
	bl sub_08087248
	ldrh r1, [r6]
	lsls r1, r1, #8
	adds r0, r0, r1
	strh r0, [r4]
	movs r1, #0
	movs r0, #8
	mov r2, r8
	strh r0, [r2]
	strh r1, [r7]
	b _08086550
	.align 2, 0
_08086540: .4byte gUnknown_03005990
_08086544: .4byte gUnknown_02027F74
_08086548: .4byte gUnknown_03002B34
_0808654C:
	mov r1, r8
	strh r0, [r1]
_08086550:
	movs r0, #0
	str r0, [r5, #0x2c]
	ldr r0, _08086574 @ =0x0000FFFF
	strh r0, [r6]
	ldr r2, _08086578 @ =gUnknown_03001FE8
	ldrb r1, [r2, #1]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #1]
	bl sub_080876B4
	movs r0, #0x76
	bl sub_0803B4DC
	b _08086674
	.align 2, 0
_08086574: .4byte 0x0000FFFF
_08086578: .4byte gUnknown_03001FE8
_0808657C:
	movs r0, #0x88
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08086674
	ldr r3, _080865C0 @ =gUnknown_081D941C
	ldr r1, [r3]
	ldr r2, _080865C4 @ =gUnknown_081D9420
	ldr r4, [r2]
	movs r6, #0
	ldrsh r0, [r4, r6]
	adds r0, r0, r1
	ldr r1, [r5, #0x5c]
	strb r1, [r0]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r2
	cmp r0, #8
	ble _080865AC
	movs r0, #2
	strh r0, [r4]
_080865AC:
	adds r7, r5, #0
	adds r7, #0x4e
	adds r6, r5, #0
	adds r6, #0x52
	movs r0, #0x4c
	adds r0, r0, r5
	mov r8, r0
	ldr r1, _080865C8 @ =gUnknown_081D9418
	mov sb, r1
	b _080865DE
	.align 2, 0
_080865C0: .4byte gUnknown_081D941C
_080865C4: .4byte gUnknown_081D9420
_080865C8: .4byte gUnknown_081D9418
_080865CC:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _080865DE
	movs r0, #2
	strh r0, [r4]
_080865DE:
	mov r2, sl
	ldr r4, [r2]
	ldrb r0, [r4]
	bl sub_08037448
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080865CC
	ldr r1, _08086644 @ =gUnknown_03005990
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	ldrb r3, [r0]
	str r3, [r5, #0x5c]
	mov r0, sb
	ldr r2, [r0]
	ldr r0, _08086648 @ =gUnknown_02027F74
	adds r0, #0x37
	ldrb r1, [r0]
	ldrh r0, [r2]
	cmp r0, r1
	bls _0808660C
	strh r1, [r2]
_0808660C:
	ldrh r0, [r2]
	adds r0, r3, r0
	str r0, [r5, #0x58]
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, #0
	bne _08086620
	ldrh r0, [r6]
	cmp r0, #0
	beq _08086650
_08086620:
	bl sub_08013C54
	bl sub_08013AFC
	ldr r4, _0808664C @ =gUnknown_03002B34
	bl sub_08087248
	ldrh r1, [r6]
	lsls r1, r1, #8
	adds r0, r0, r1
	strh r0, [r4]
	movs r1, #0
	movs r0, #8
	mov r2, r8
	strh r0, [r2]
	strh r1, [r7]
	b _08086654
	.align 2, 0
_08086644: .4byte gUnknown_03005990
_08086648: .4byte gUnknown_02027F74
_0808664C: .4byte gUnknown_03002B34
_08086650:
	mov r1, r8
	strh r0, [r1]
_08086654:
	movs r0, #0
	str r0, [r5, #0x2c]
	movs r0, #1
	strh r0, [r6]
	ldr r2, _08086684 @ =gUnknown_03001FE8
	ldrb r1, [r2, #1]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2, #1]
	bl sub_080876B4
	movs r0, #0x76
	bl sub_0803B4DC
_08086674:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08086684: .4byte gUnknown_03001FE8

